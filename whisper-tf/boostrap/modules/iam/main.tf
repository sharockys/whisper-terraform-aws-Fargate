
data "aws_iam_policy" "secret_manager" {
  arn = "arn:aws:iam::aws:policy/SecretsManagerReadWrite" # check this later
}


data "aws_iam_policy" "code_commit" {
  arn = "arn:aws:iam::aws:policy/AWSCodeCommitFullAccess"
}

data "aws_iam_policy" "code_build" {
  arn = "arn:aws:iam::aws:policy/AWSCodeBuildAdminAccess"
}





