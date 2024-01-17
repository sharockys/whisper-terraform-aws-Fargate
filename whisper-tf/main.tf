terraform {
  cloud {
    organization = "haoxian"
    workspaces {
      name = "whisper"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.32.1"
    }
    github = {
      source  = "integrations/github"
      version = "6.0.0-alpha"
    }
  }
}

provider "aws" {
  region = var.region
}

# provider "github" {
#   token = var.github_token
#   owner = var.repository_owner
# }

