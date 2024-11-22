resource "aws_lambda_function" "data_cleaner" {
  function_name     = "data_cleaner"
  role              = var.lambda_role_arn
  handler           = "lambda_handler.lambda_handler"
  runtime           = "python3.8"
  filename          = var.lambda_zip_file
  source_code_hash  = filebase64sha256(var.lambda_zip_file)

  layers = [
    "arn:aws:lambda:us-west-2:336392948345:layer:AWSDataWrangler-Python38:1"]
  
  environment {
    variables = {
      CLEANED_BUCKET = var.cleaned_bucket
      RAW_BUCKET     = var.raw_bucket
    }
  }

  depends_on = [var.lambda_policy_attachment_id]
}
