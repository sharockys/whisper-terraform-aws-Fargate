variable "project_name" {
  type        = string
  description = "Name of the project"
  default     = "whisper"
}

variable "subnet_public_cidr_block" {
  type        = string
  description = "CIDR block for the public subnet"
  default     = "10.0.0.0/21"
}

variable "subnet_private_cidr_block" {
  type        = string
  description = "CIDR block for the private subnet"
  default     = "10.0.8.0/21"
}

variable "vpc_cidr_block" {
  type        = string
  description = "VPC CIDR block"
  default     = "10.0.0.0/16"
}


