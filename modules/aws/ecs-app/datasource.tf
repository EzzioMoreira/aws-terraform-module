data "aws_region" "current" {}

data "aws_iam_role" "this" {
  name = "ecsTaskExecutionRole"
}
