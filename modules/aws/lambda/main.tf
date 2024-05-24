resource "aws_lambda_function" "this" {
  filename      = var.lambda_function_payload
  function_name = var.lambda_function_name
  description   = var.description
  role          = aws_iam_role.this.arn
  runtime       = var.lambda_runtime
  handler       = var.handler
  logging_config {
    log_format = "JSON"
    log_group  = aws_cloudwatch_log_group.this.name
  }

  dynamic "environment" {
    for_each = length(keys(var.environment_variables)) == 0 ? [] : [true]
    content {
      variables = var.environment_variables
    }
  }

  lifecycle {
    ignore_changes = [environment]
  }

  tags = var.tags
}
