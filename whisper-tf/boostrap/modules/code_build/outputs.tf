output "project_name" {
  description = "Project name"
  value       = aws_codebuild_project.whisper_app_build.name
}

output "project_id" {
  description = "Project ID"
  value       = aws_codebuild_project.whisper_app_build.id
}

output "badge_url" {
  description = "The URL of the build badge when badge_enabled is enabled"
  value       = aws_codebuild_project.whisper_app_build.badge_url
}

output "project_arn" {
  description = "Project ARN"
  value       = aws_codebuild_project.whisper_app_build.arn
}
