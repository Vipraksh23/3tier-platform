resource "random_password" "database" {

  length = 20

  special = true

  override_special = "!@#%^*-_=+"

}

resource "aws_secretsmanager_secret" "database" {

  name = "${local.name_prefix}-database-secret"

  description = "Database credentials"

  recovery_window_in_days = 7

  tags = merge(

    local.common_tags,

    {

      Name = "${local.name_prefix}-database-secret"

    }

  )

}

resource "aws_secretsmanager_secret_version" "database" {

  secret_id = aws_secretsmanager_secret.database.id

  secret_string = jsonencode({

    username = var.db_username

    password = random_password.database.result

    database = var.db_name

  })

}