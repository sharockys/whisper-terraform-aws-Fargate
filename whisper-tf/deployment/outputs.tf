output "ecs_cluster_name" {
  value       = module.ecs.ecs_cluster_name
  description = "The name of the ECS Cluster"
}

output "ecs_task_definition_arn" {
  value       = module.ecs.ecs_task_definition_arn
  description = "The ARN of the ECS Task Definition"
}

output "ecs_service_name" {
  value       = module.ecs.ecs_service_name
  description = "The name of the ECS Service"
}

output "security_group_id" {
  value       = module.ecs.security_group_id
  description = "The ID of the Security Group"
}

# output "public_ip" {
#   value       = module.ecs.public_ip
#   description = "The public IP address of the instance"
# }


