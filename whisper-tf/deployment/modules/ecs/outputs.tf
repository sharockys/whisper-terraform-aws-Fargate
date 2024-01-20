output "ecs_cluster_name" {
  value       = aws_ecs_cluster.whisper_app_cluster.name
  description = "The name of the ECS Cluster"
}

output "ecs_task_definition_arn" {
  value       = aws_ecs_task_definition.whisper_app_task.arn
  description = "The ARN of the ECS Task Definition"
}

output "ecs_service_name" {
  value       = aws_ecs_service.whisper_app_service.name
  description = "The name of the ECS Service"
}

output "security_group_id" {
  value       = aws_security_group.whisper_app_sg.id
  description = "The ID of the Security Group"
}

output "dns_name" {
  value       = aws_lb.whisper_lb.dns_name
  description = "The DNS name of the load balancer"
}

# output "public_ip" {
#   value       = aws_eip.whiper_app_eip.public_ip
#   description = "The public IP address of the instance"
#   depends_on  = [aws_eip.whiper_app_eip]
# }

# output "whiper_app_eip_id" {
#   value       = aws_eip.whiper_app_eip.id
#   description = "The ID of the EIP"
# }

# output "whiper_app_nat_gateway_id" {
#   value       = aws_nat_gateway.whisper_app_nat_gateway.id
#   description = "The ID of the NAT Gateway"
# }

