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

output "dns_name" {
  value       = module.ecs.dns_name
  description = "The DNS name of the load balancer"
}

