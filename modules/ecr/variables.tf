variable "name" {
  type        = string
  description = "Name of the ECR repository"
}

variable "image_tag_mutability" {
  type        = string
  default     = "MUTABLE"
  description = "Image tag mutability setting"
}

variable "encryption_type" {
  type        = string
  default     = "AES256"
  description = "Encryption type for the repository"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags to apply to the repository"
}
