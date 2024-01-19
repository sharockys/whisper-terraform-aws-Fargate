variable "aws_region" {
  # get from parent 
  description = "AWS region"
  default     = "us-east-1"
}

variable "ecr_repository_url" {
  # get from parent 
  description = "ECR repository URL"
}

variable "code_commit_repo_url" {
  description = "CodeCommit repository URL"
}
