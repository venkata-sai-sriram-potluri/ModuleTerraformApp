provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket = var.s3_backend_bucket
    key    = var.s3_backend_key
    region = var.region
  }
}

# Network Module
module "network" {
  source = "/modules/network"
  vpc_cidr_block = "11.0.0.0/16"
  public_subnet_cidrs = [
    "11.0.1.0/24",
    "11.0.2.0/24"
  ]
}

# ECR Module
module "ecr" {
  source = "/modules/ecr"
  repo_name = var.ecr_repo
}

# RDS Module
module "rds" {
  source = "/modules/rds"

  db_identifier              = "my-python-db"
  db_engine_version          = "8.0.32"
  db_instance_class          = "db.t3.micro"
  db_allocated_storage       = 20
  db_name                    = "myappdb"
  db_username                = var.db_username
  db_password                = var.db_password
  db_subnet_group_name       = "my-db-subnet-group"
  db_security_group_id       = module.network.rds_sg_id
  public_subnet_ids          = module.network.public_subnet_ids
  db_secret_name             = "myapp-db-credentials"
  db_secret_access_policy_name = "MyAppDBSecretAccess"
}

# ECS Module
module "ecs" {
  source = "/modules/ecs"

  cluster_name        = "flask-cluster"
  service_name        = "flask-service"
  task_family         = "flask-task"
  container_name      = "flask-app"
  container_port      = 5000
  region              = var.region
  aws_account_id      = var.aws_account_id
  ecr_repo            = var.ecr_repo
  secret_arn          = module.rds.db_secret_arn
  execution_role_name = "ecsTaskExecutionRole"
  task_role_name      = "ecsTaskRole"
  log_group_name      = "/ecs/flask-app"
  vpc_id              = module.network.vpc_id
  public_subnet_ids   = module.network.public_subnet_ids
  ecs_sg_id           = module.network.ecs_sg_id
  db_secret_access_policy_arn = module.rds.db_secret_access_policy_arn
}
