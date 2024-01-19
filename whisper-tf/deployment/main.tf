terraform {
  cloud {
    organization = "haoxian"
    workspaces {
      name = "whisper-deploy"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.32.1"
    }
  }
}

data "terraform_remote_state" "bootstrap" {
  backend = "remote"
  config = {
    organization = "haoxian"
    workspaces = {
      name = "whisper"
    }
  }
}


provider "aws" {
  region = var.region
}

module "ecs" {
  source             = "./modules/ecs"
  region             = var.region
  ecr_repository_url = data.terraform_remote_state.bootstrap.outputs.ecr_repository_url
  public_subnet_id   = data.terraform_remote_state.bootstrap.outputs.public_subnet_id
  private_subnet_id  = data.terraform_remote_state.bootstrap.outputs.private_subnet_id
  nat_gateway_id     = data.terraform_remote_state.bootstrap.outputs.nat_gateway_id
  vpc_id             = data.terraform_remote_state.bootstrap.outputs.vpc_id
}
