resource "aws_ecr_repository" "repositories" {

  for_each = local.repositories

  name = "${local.name_prefix}-${each.value}"

  image_tag_mutability = var.image_tag_mutability

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "AES256"
  }

  tags = merge(
    local.common_tags,
    {
      Name      = "${local.name_prefix}-${each.value}"
      Component = each.value
    }
  )
}


resource "aws_ecr_lifecycle_policy" "repositories" {

  for_each = aws_ecr_repository.repositories

  repository = each.value.name

  policy = jsonencode({

    rules = [

      {

        rulePriority = 1

        description = "Retain last 10 tagged images"

        selection = {

          tagStatus = "any"

          countType = "imageCountMoreThan"

          countNumber = 20

        }

        action = {

          type = "expire"

        }

      }

    ]

  })

}