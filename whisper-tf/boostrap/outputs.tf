output "code_commit_repo_url" {
  value = module.code_commit.code_commit_repo_url
}


output "code_commit_ssh_url" {
  value = module.code_commit.code_commit_ssh_url
}

output "ecr_repository_url" {
  value = module.ecr.ecr_repository_url
}

output "vpc_id" {
  value = module.vpc_module.vpc_id
}

output "public_subnet_id" {
  value = module.vpc_module.public_subnet_id
}
output "private_subnet_id" {
  value = module.vpc_module.private_subnet_id
}
output "eip_id" {
  value = module.vpc_module.eip_id
}

output "nat_gateway_id" {
  value = module.vpc_module.nat_gateway_id
}

output "public_route_table_id" {
  value = module.vpc_module.public_route_table_id
}
