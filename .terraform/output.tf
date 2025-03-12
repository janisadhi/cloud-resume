output "api_url" {
  description = "The URL of the API Gateway"
  value       = aws_apigatewayv2_api.VisitorCounterAPI.api_endpoint
}

output "dynamodb_table_name" {
  description = "The name of the DynamoDB table"
  value       = aws_dynamodb_table.VisitorCount.name
}

output "lambda_function_name" {
  description = "The name of the Lambda function"
  value       = aws_lambda_function.VisitorCounterFunction.function_name
}

output "lambda_role_arn" {
  description = "The ARN of the Lambda IAM role"
  value       = aws_iam_role.lambda_role.arn
}
