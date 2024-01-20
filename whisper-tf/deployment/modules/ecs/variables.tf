variable "region" {
  description = "AWS region"
  default     = "us-east-1"

}

variable "ecr_repository_url" {
  description = "The URL of the ECR repository"
  type        = string
}


variable "ecs_task_desired_count" {
  description = "The number of instances of the task to run"
  type        = number
  default     = 3
}

variable "ecs_task_deployment_minimum_healthy_percent" {
  description = "The lower limit on the number of running tasks during a deployment"
  type        = number
  default     = 50
}

variable "ecs_task_deployment_maximum_percent" {
  description = "The upper limit on the number of running tasks during a deployment"
  type        = number
  default     = 200
}

variable "ecr_repository_tag" {
  description = "The tag of the ECR repository"
  type        = string
  default     = "latest"
}

variable "cpu_units" {
  description = "The number of cpu units to reserve for the container"
  type        = number
  default     = 2048 # 1024 = 1 vCPU
}

variable "memory" {
  description = "The amount of memory (in MiB) to allow the container to use"
  type        = number
  default     = 4096
}


