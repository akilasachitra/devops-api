output "cd_user_acess_key_id" {
  description = "aws iam user access key id"
  value = aws_iam_access_key.cd.id 
}

output "cd_user_aceess_key_secret" {
  description = "acess key secret for aws iam user"
  value = aws_iam_access_key.cd.secret 
  sensitive = true
}

output "ecr_rep_app" {
  description = "ECR repository for app"
  value = aws_ecr_repository.app.repository_url
}


output "ecr_rep_proxy" {
  description = "ECR repository for proxy"
  value = aws_ecr_repository.proxy.repository_url
}
