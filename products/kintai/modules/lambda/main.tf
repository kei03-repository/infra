resource "aws_lambda_function" "this" {
  function_name    = var.function_name
  filename         = var.filename
  source_code_hash = filebase64sha256(var.filename)
  role             = var.role_arn
  handler          = var.handler
  runtime          = var.runtime
  timeout          = var.timeout
  memory_size      = var.memory_size

  environment {
    variables = var.environment_variables
  }

  tags = var.tags
}
