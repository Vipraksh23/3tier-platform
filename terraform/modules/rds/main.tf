# Subnet group
resource "aws_db_subnet_group" "this" {

  name = "${local.name_prefix}-db-subnet-group"

  subnet_ids = var.private_subnet_ids

  tags = merge(

    local.common_tags,

    {

      Name = "${local.name_prefix}-db-subnet-group"

    }

  )

}

# Security group
resource "aws_security_group" "rds" {

  name = "${local.name_prefix}-rds-sg"

  description = "Security group for PostgreSQL"

  vpc_id = var.vpc_id

  ingress {

    from_port = 5432

    to_port = 5432

    protocol = "tcp"

    cidr_blocks = var.allowed_cidr_blocks

  }

  egress {

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = merge(

    local.common_tags,

    {

      Name = "${local.name_prefix}-rds-sg"

    }

  )

}


# RDS creation
resource "aws_db_instance" "postgres" {

  identifier = "${local.name_prefix}-postgres"

  engine = "postgres"

  engine_version = var.engine_version

  instance_class = var.instance_class

  allocated_storage = var.allocated_storage

  storage_type = "gp3"

  storage_encrypted = true

  db_name = var.db_name

  username = var.db_username

  password = var.db_password

  port = 5432

  db_subnet_group_name = aws_db_subnet_group.this.name

  vpc_security_group_ids = [
    aws_security_group.rds.id
  ]

  multi_az = var.multi_az

  publicly_accessible = false

  deletion_protection = var.environment == "prod"

  backup_retention_period = var.environment == "prod" ? 7 : 1

  backup_window = "03:00-04:00"

  maintenance_window = "sun:04:00-sun:05:00"

  skip_final_snapshot = var.environment != "prod"

  auto_minor_version_upgrade = true

  apply_immediately = false

  enabled_cloudwatch_logs_exports = [
    "postgresql"
  ]

  tags = merge(
    local.common_tags,
    {
      Name = "${local.name_prefix}-postgres"
    }
  )

}