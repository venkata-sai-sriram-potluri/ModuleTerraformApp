resource "aws_ecr_repository" "flask_app" {
  name                 = var.name
  image_tag_mutability = var.image_tag_mutability

  encryption_configuration {
    encryption_type = var.encryption_type
  }

  tags = var.tags
}
