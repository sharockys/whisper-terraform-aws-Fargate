data "aws_iam_policy_document" "task_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"
    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ecs_task_execution_role" {
  name               = "whisper-ecs-task-execution-role"
  assume_role_policy = data.aws_iam_policy_document.task_assume_role_policy.json
}

resource "aws_iam_role" "ecs_task_iam_role" {
  name               = "ecs-task-iam-role"
  assume_role_policy = data.aws_iam_policy_document.task_assume_role_policy.json
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution_role_policy" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}
