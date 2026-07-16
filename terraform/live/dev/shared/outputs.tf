output "repository_urls" {
  description = "ECR Repository URLs"

  value = module.ecr.repository_urls
}

output "repository_names" {
  description = "ECR Repository Names"

  value = module.ecr.repository_names
}