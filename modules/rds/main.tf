# modules/rds/main.tf

resource "aws_db_subnet_group" "default" {
  name       = "my-db-subnet-group"
  subnet_ids = var.public_subnet_ids

  tags = {
    Name = "My DB subnet group"
  }
}

resource "aws_db_instance" "mydb" {
  identifier              = "my-python-db"
  engine                  = "mysql"
  instance_class          = "db.t3.micro"
  engine_version          = "8.0.32"
  allocated_storage       = 20
  db_name                 = "myappdb"
  username                = var.db_username
  password                = var.db_password
  publicly_accessible     = true
  skip_final_snapshot     = true
  vpc_security_group_ids  = [var.rds_sg_id]
  db_subnet_group_name    = aws_db_subnet_group.default.name

  tags = {
    Name = "MyPythonAppDB"
  }
}
