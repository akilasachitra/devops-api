## Create ECR repository for Docker images

resource "aws_ecr_repository" "app" {
  name                 = "devsops-app-api-app"
  image_tag_mutability = "MUTABLE"
  force_delete = true
  
  image_scanning_configuration {
    scan_on_push = false
  }
}

resource "aws_ecr_repository" "proxy" {
  name                 = "devsops-app-api-proxy"
  image_tag_mutability = "MUTABLE"
  force_delete = true
  
  image_scanning_configuration {
    scan_on_push = false
  }
}
