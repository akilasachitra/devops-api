terraform {
    required_providers {
        github = {
        source  = "hashiocorp/aws"
        version = "5.23.0"
        }
    }
    backend "s3" {
        bucket         = "devops-akila1"
        key            = "tf-state-deploy"
        workspace_key_prefix = "tf-state-deploy-env"
        region         = "ap-southeast-2"
        encrypt        = true
        dynamodb_table = "devops_terraformlock"    
      
    }
}
     provider "aws" {
     region = "ap-southeast-2"
     default_tags {
    tags = {
      Environment = "terraform.workspace"
      Project     = "var.project"
      Conatact  = "VAR.contact"
      MAnagedBy  = "Terraform/setup"    
    }
  }

}
locals {
   prefix = "${var.prefix}-${terraform.workspace}"
}


data "aws_region" "current" {
  
}
