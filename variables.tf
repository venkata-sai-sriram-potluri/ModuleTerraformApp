variable "region" {
  default = "us-east-2"
}

variable "aws_account_id" {}
variable "ecr_repo" {}
variable "db_username" {}
variable "db_password" {
  sensitive = true
}
variable "s3_backend_bucket" {}
variable "s3_backend_key" {}