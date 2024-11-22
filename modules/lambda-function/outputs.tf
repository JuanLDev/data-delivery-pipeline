output "lambda_function_arn" {
  description = "The ARN of the Lambda function"
  value       = aws_lambda_function.data_cleaner.arn
}
