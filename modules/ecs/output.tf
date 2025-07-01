output "ecs_cluster_id" {
  value       = aws_ecs_cluster.this.id
  description = "ECS Cluster ID"
}

output "ecs_task_definition_arn" {
  value       = aws_ecs_task_definition.flask.arn
  description = "ECS Task Definition ARN"
}

output "ecs_service_name" {
  value       = aws_ecs_service.flask.name
  description = "ECS Service Name"
}