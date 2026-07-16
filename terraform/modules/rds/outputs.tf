output "db_endpoint" {
  description = "RDS endpoint"
  value       = aws_db_instance.postgres.endpoint
}

output "db_port" {
  description = "RDS port"
  value       = aws_db_instance.postgres.port
}

output "db_security_group_id" {
  description = "RDS security group"
  value       = aws_security_group.rds.id
}

output "db_subnet_group" {
  description = "DB subnet group"
  value       = aws_db_subnet_group.this.name
}