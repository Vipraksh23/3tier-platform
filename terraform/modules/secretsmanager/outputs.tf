output "secret_arn" {

  description = "Secrets Manager ARN"

  value = aws_secretsmanager_secret.database.arn

}

output "secret_name" {

  description = "Secrets Manager name"

  value = aws_secretsmanager_secret.database.name

}

output "db_password" {

  description = "Generated database password"

  value = random_password.database.result

  sensitive = true

}