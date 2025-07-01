output "vpc_id" {
  value = module.network.vpc_id
}

output "public_subnet_ids" {
  value = module.network.public_subnet_ids
}

output "db_endpoint" {
  value = module.rds.db_endpoint
}

output "ecs_cluster_arn" {
  value = module.ecs.cluster_arn
}