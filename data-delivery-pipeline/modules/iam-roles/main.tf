# Define the IAM Role for Lambda Function
resource "aws_iam_role" "lambda_exec_role" {
  name = "lambda_exec_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}
resource "aws_iam_policy" "lambda_policy" {
  name   = "lambda_policy"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = ["s3:GetObject", "s3:PutObject"],
        Resource = [
          "arn:aws:s3:::${var.raw_bucket}/*",
          "arn:aws:s3:::${var.cleaned_bucket}/*"
        ]
      },
      {
        Effect = "Allow",
        Action = ["lambda:GetLayerVersion", "lambda:ListLayerVersions"],
        Resource = "*"
      },
      {
        Effect = "Allow",
        Action = ["logs:CreateLogGroup", "logs:CreateLogStream", "logs:PutLogEvents"],
        Resource = "*"
      }
    ]
  })
}


# Attach the Policy to the IAM Role
resource "aws_iam_role_policy_attachment" "lambda_attach_policy" {
  role       = aws_iam_role.lambda_exec_role.name
  policy_arn = aws_iam_policy.lambda_policy.arn
}

# Grant the `popeye` user access to the Lambda Layer
resource "aws_iam_user_policy" "popeye_layer_access" {
  name = "popeye_layer_access"
  user = "popeye"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = ["lambda:GetLayerVersion", "lambda:ListLayerVersions"],
        Resource = [
          "arn:aws:lambda:us-west-2:336392948345:layer:AWSDataWrangler-Python311:*",
          "arn:aws:lambda:us-west-2:277707129094:layer:numpy-layer:*",
          "arn:aws:lambda:us-west-2:336392948345:layer:*" # Added broader access
        ]
      }
    ]
  })
}
