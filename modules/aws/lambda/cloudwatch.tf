resource "aws_cloudwatch_log_group" "this" {
  name              = "/aws/lambda/${var.lambda_function_name}"
  retention_in_days = var.log_retention_in_days

  tags_all = var.tags
}
