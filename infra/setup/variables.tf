variable "tf_state_bucket" {
  description = "S3 bucket for Terraform state"
  default     = "devops-akila1"
}

variable "tf_state_lock_table" {
  description = "DynamoDB table for Terraform state locking"
  default     = "devops_terraformlock"
}

variable "project" {
  description = "Project name for tagging"
  default     = "devops-app"
}

variable "contact" {
  description = "Contact information for the project"
  default     = "test@gmail.com"

}
