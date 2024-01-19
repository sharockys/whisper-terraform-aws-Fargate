resource "aws_codebuild_project" "whisper_app_build" {
  name        = "whisper-app-build"
  description = "CodeBuild project for building Docker image for Whisper App"

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:7.0"
    type                        = "LINUX_CONTAINER"
    privileged_mode             = true # maybe not 
    image_pull_credentials_type = "CODEBUILD"
    environment_variable {
      name  = "AWS_DEFAULT_REGION"
      value = var.aws_region
    }
  }

  source {
    type     = "CODECOMMIT"
    location = var.code_commit_repo_url
    buildspec = templatefile("${path.module}/buildspec.yml.tpl", {
      region             = var.aws_region
      ecr_repository_url = var.ecr_repository_url
    })
  }

  service_role = aws_iam_role.whisper_codebuild_role.arn
}

resource "aws_iam_role" "whisper_codebuild_role" {
  name = "whisper_codebuild_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "codebuild.amazonaws.com"
        },
      },
    ]
  })
}

resource "aws_iam_policy" "codebuild_policy" {
  name        = "CodeBuildPolicyLogs"
  description = "IAM policy for AWS CodeBuild to create CloudWatch Logs log streams"

  # logs permission and CodeBuild git clone permission
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogStream",
        "logs:PutLogEvents",
        "logs:CreateLogGroup"

      ],
      "Resource": "arn:aws:logs:us-east-1:599216804599:log-group:/aws/codebuild/whisper-app-build:log-stream:*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "codecommit:GitPull"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "ecr:GetAuthorizationToken",
        "ecr:BatchCheckLayerAvailability",
        "ecr:GetDownloadUrlForLayer",
        "ecr:BatchGetImage",
        "ecr:InitiateLayerUpload",
        "ecr:UploadLayerPart",
        "ecr:CompleteLayerUpload",
        "ecr:PutImage"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_policy_attachment" "codebuild_role_attachment" {
  name       = "codebuild_role_attachment"
  policy_arn = aws_iam_policy.codebuild_policy.arn
  roles      = [aws_iam_role.whisper_codebuild_role.name]
}
