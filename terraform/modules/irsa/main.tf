resource "aws_iam_role" "irsa" {

  name = "${local.name_prefix}-backend-irsa"

  assume_role_policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {

        Effect = "Allow"

        Principal = {

          Federated = var.oidc_provider_arn

        }

        Action = "sts:AssumeRoleWithWebIdentity"

        Condition = {

          StringEquals = {

            "${replace(var.oidc_provider_url, "https://", "")}:aud" = "sts.amazonaws.com"

            "${replace(var.oidc_provider_url, "https://", "")}:sub" = "system:serviceaccount:${var.namespace}:${var.service_account_name}"

          }

        }

      }

    ]

  })

  tags = local.common_tags

}


resource "aws_iam_policy" "secretsmanager_read" {

  name = "${local.name_prefix}-secrets-policy"

  policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {

        Effect = "Allow"

        Action = [

          "secretsmanager:GetSecretValue"

        ]

        Resource = [

          var.secret_arn

        ]

      }

    ]

  })

}


resource "aws_iam_role_policy_attachment" "secrets" {

  role = aws_iam_role.irsa.name

  policy_arn = aws_iam_policy.secretsmanager_read.arn

}