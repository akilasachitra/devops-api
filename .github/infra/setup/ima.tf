################################################
# Create IAM user and policies for CD pipeline # 
################################################

resource "aws_iam_user" "cd" {
  name = "app-api-cd-user"
}

resource "aws_iam_access_key" "cd" {
  user = aws_iam_user.cd.name
}

###############################################
# Create policy for S3 and dynamoDB access    #
###############################################

data "aws_iam_policy_document" "tf_backend" {
  statement {
    effect = "Allow" 
    actions = [
      "s3:ListBucket"     
    ]
    resources = [
      "arn:aws:s3:::${var.tf_state_bucket}",
     // "arn:aws:dynamodb:ap-southeast-2:123456789012:table/devops_terraformlock"
    ]
  }

statement {
    effect = "Allow"
    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:DeleteObject"
    ]
    resources = [
      "arn:aws:s3:::${var.tf_state_bucket}/tf-state-deploy/*",
      "arn:aws:s3:::${var.tf_state_bucket}/tf-state-deploy-env/*",
    ]
  }

  statement {
    effect = "Allow"
    actions = [
      "dynamodb:GetItem",
      "dynamodb:PutItem",
      "dynamodb:DeleteItem",
      "dynamodb:UpdateItem",

    ]
    resources = [
      "arn:aws:dynamodb:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:table/${var.tf_state_lock_table}"
    ]
  }


}




  

