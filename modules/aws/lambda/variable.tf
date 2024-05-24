variable "lambda_function_name" {
  description = "The name of the Lambda function"
  type        = string
}

variable "description" {
  description = "The description of the Lambda function"
  type        = string
}

variable "lambda_function_payload" {
  description = "The path to the deployment package of the Lambda function"
  type        = string
  default     = "lambda_function_payload.zip"
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}

# https://docs.aws.amazon.com/pt_br/lambda/latest/api/API_CreateFunction.html#API_CreateFunction_RequestSyntax
variable "lambda_runtime" {
  description = "The runtime to use for the Lambda function"
  type        = string
  default     = "python3.8"
}

variable "package_type" {
  description = "The Lambda deployment package type. Valid options: Zip or Image"
  type        = string
  default     = "Zip"
}

variable "handler" {
  description = "Lambda Function entrypoint in your code"
  type        = string
  default     = ""
}

variable "environment_variables" {
  description = "A map that defines environment variables for the Lambda Function."
  type        = map(string)
  default     = {}
}

variable "log_retention_in_days" {
  description = "The number of days log events are kept in CloudWatch Logs"
  type        = number
  default     = 14
}
