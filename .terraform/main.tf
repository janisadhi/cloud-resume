provider "aws" {
  region = "eu-north-1"  # Specify your AWS region here
}

# Create DynamoDB table
resource "aws_dynamodb_table" "VisitorCount" {
  name         = "VisitorCount"
  hash_key     = "id"
  billing_mode = "PAY_PER_REQUEST"
  attribute {
    name = "id"
    type = "S"
  }
}

# Create IAM role for Lambda function with basic execution permissions
resource "aws_iam_role" "lambda_role" {
  name = "VisitorCounterLambdaRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Effect    = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

# Attach basic Lambda execution policy
resource "aws_iam_policy_attachment" "lambda_basic_execution" {
  name       = "lambda-basic-execution"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  roles      = [aws_iam_role.lambda_role.name]
}

# Attach the AmazonDynamoDBFullAccess policy to the Lambda role
resource "aws_iam_policy_attachment" "lambda_dynamodb_access" {
  name       = "lambda-dynamodb-access"
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
  roles      = [aws_iam_role.lambda_role.name]
}

# Lambda function
resource "aws_lambda_function" "VisitorCounterFunction" {
  function_name = "VisitorCounterFunction"
  runtime       = "python3.9"
  role          = aws_iam_role.lambda_role.arn
  handler       = "lambda_function.lambda_handler"
  filename      = "../backend/lambda_function.py.zip" # Ensure to zip your lambda function and place it in this path

  # You can define environment variables here if needed
  environment {
    variables = {
      TABLE_NAME = aws_dynamodb_table.VisitorCount.name
    }
  }
}

# Create HTTP API
resource "aws_apigatewayv2_api" "VisitorCounterAPI" {
  name          = "VisitorCounterAPI"
  protocol_type = "HTTP"
}

# Create route for GET method
resource "aws_apigatewayv2_route" "get_visitor_count" {
  api_id    = aws_apigatewayv2_api.VisitorCounterAPI.id
  route_key = "GET /visitor"
  target    = "integrations/${aws_apigatewayv2_integration.lambda_integration.id}"
}

# Create Lambda integration with API Gateway
resource "aws_apigatewayv2_integration" "lambda_integration" {
  api_id             = aws_apigatewayv2_api.VisitorCounterAPI.id
  integration_type  = "AWS_PROXY"
  integration_uri   = aws_lambda_function.VisitorCounterFunction.arn
  integration_method = "POST"
}



# Deploy the API
resource "aws_apigatewayv2_stage" "stage" {
  api_id     = aws_apigatewayv2_api.VisitorCounterAPI.id
  name       = "production"
  auto_deploy = true
}
