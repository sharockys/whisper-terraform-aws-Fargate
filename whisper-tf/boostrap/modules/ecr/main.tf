resource "aws_ecr_repository" "whisper_docker_repo" {
  name                 = "whisper-docker-repo"
  image_tag_mutability = "MUTABLE"
}

# resource "aws_ecr_lifecycle_policy" for clease up old images that are not used
