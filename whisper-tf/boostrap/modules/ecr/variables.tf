variable "ecr_container_image" {
  type        = string
  description = "Image name for the Lambda function"
  default     = "whisper-docker"
}

variable "ecr_image_tag" {
  type        = string
  description = "Image tag for the Lambda function"
  default     = "latest"
}
