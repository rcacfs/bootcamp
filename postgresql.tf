locals {
  password = var.password == "" ? random_id.password.b64_url : var.password
}

resource "random_id" "password" {
  byte_length = 10
}

resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "db-subnet-group"
  subnet_ids = [aws_subnet.db-private-a.id, aws_subnet.db-private-b.id]
  tags = {
    Name = "bootcamp-prod-db-subnet-group"
  }
}

resource "aws_db_instance" "postgres_database" {
  identifier                      = var.name
  engine                          = var.engine_name
  engine_version                  = var.engine_version
  port                            = var.port
  username                        = var.username
  password                        = local.password
  deletion_protection             = var.deletion_protection
  apply_immediately               = var.apply_immediately
  instance_class                  = var.instance_class
  allocated_storage               = var.allocated_storage
  max_allocated_storage           = var.max_allocated_storage
  skip_final_snapshot             = true
  license_model                   = var.license_model
  db_subnet_group_name            = aws_db_subnet_group.db_subnet_group.id
  vpc_security_group_ids          = [aws_security_group.db_security_group.id]
  publicly_accessible             = var.publicly_accessible
  storage_encrypted               = var.storage_encrypted
  storage_type                    = var.storage_type
  enabled_cloudwatch_logs_exports = ["postgresql", "upgrade"]

  tags = {
    Name = var.name
    env  = "backup"
  }

  timeouts {
    create = "2h"
    delete = "2h"
    update = "2h"
  }
}
