
data "aws_iam_policy" "secret_manager" {
  arn = "arn:aws:iam::aws:policy/SecretsManagerReadWrite" # check this later
}

data "aws_iam_policy" "lambda_execute" {
  arn = "arn:aws:iam::aws:policy/AWSLambdaExecute"
}

data "aws_iam_policy" "lambda_vpc" {
  arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
}

data "aws_iam_policy" "code_commit" {
  arn = "arn:aws:iam::aws:policy/AWSCodeCommitFullAccess"
}

data "aws_iam_policy" "code_build" {
  arn = "arn:aws:iam::aws:policy/AWSCodeBuildAdminAccess"
}

data "aws_iam_policy" "lambda_efs_full_access" {
  arn = "arn:aws:iam::aws:policy/AmazonElasticFileSystemFullAccess"
}

resource "aws_iam_role" "lambda_efs_transformers" {
  name               = "lambdaEFSTransformers"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": "LambdaEFS"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda_execute_policy" {
  role       = aws_iam_role.lambda_efs_transformers.id
  policy_arn = data.aws_iam_policy.lambda_execute.arn
}

resource "aws_iam_role_policy_attachment" "lambda_vpc_policy" {
  role       = aws_iam_role.lambda_efs_transformers.id
  policy_arn = data.aws_iam_policy.lambda_vpc.arn
}

resource "aws_iam_role_policy_attachment" "lambda_efs_full_access_policy" {
  role       = aws_iam_role.lambda_efs_transformers.id
  policy_arn = data.aws_iam_policy.lambda_efs_full_access.arn
}




