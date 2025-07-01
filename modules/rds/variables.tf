variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "rds_sg_id" {
  description = "RDS security group ID"
  type        = string
}

variable "db_username" {
  description = "Database username"
  type        = string
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}