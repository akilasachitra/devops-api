output "cd_user_acess_key_id" {
  description = "aws iam user access key id"
  value = aws_iam_access_key.cd.id 
}

output "cd_user_aceess_key_secret" {
  description = "acess key secret for aws iam user"
  value = aws_iam_access_key.cd.secret 
  sensitive = true
}
