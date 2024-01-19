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
  }
}

provider "aws" {
  region = var.region
}

module "iam" {
  source = "./modules/iam"

}

module "ecr" {
  source = "./modules/ecr"
}


module "code_commit" {
  source     = "./modules/code_commit"
  depends_on = [module.ecr]
}

module "code_build" {
  source               = "./modules/code_build"
  aws_region           = var.region
  ecr_repository_url   = module.ecr.ecr_repository_url
  code_commit_repo_url = module.code_commit.code_commit_repo_url
  depends_on           = [module.code_commit, module.ecr]
}


