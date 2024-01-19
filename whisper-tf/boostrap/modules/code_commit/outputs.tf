
output "code_commit_repo_url" {
  value = aws_codecommit_repository.whisper_app_repo.clone_url_http
}

output "code_commit_ssh_url" {
  value = aws_codecommit_repository.whisper_app_repo.clone_url_ssh
}
