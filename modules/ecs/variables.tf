variable "region" {
  type        = string
  description = "AWS region"
}

variable "ecs_cluster_name" {
  type        = string
  description = "ECS Cluster name"
}

variable "ecs_task_family" {
  type        = string
  description = "ECS Task Definition family"
}

variable "ecs_service_name" {
  type        = string
  description = "ECS Service name"
}

variable "execution_role_arn" {
  type        = string
  description = "IAM role ARN for ECS task execution"
}

variable "task_role_arn" {
  type        = string
  description = "IAM role ARN for ECS task"
}

variable "container_image" {
  type        = string
  description = "ECR container image URI"
}

variable "db_secret_arn" {
  type        = string
  description = "Secrets Manager ARN for DB credentials"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs for ECS tasks"
}

variable "ecs_sg_id" {
  type        = string
  description = "Security Group ID for ECS"
}
