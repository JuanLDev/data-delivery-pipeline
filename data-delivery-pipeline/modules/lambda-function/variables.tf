variable "lambda_role_arn" {
  description = "The ARN of the Lambda execution role"
}

variable "lambda_policy_attachment_id" {
  description = "The ID of the policy attachment"
}

variable "lambda_zip_file" {
  description = "Path to the Lambda deployment zip file"
}

variable "raw_bucket" {
  description = "Name of the raw S3 bucket"
}

variable "cleaned_bucket" {
  description = "Name of the cleaned S3 bucket"
}
