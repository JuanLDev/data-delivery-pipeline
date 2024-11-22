variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "raw_bucket" {
  description = "Name of the raw S3 bucket"
  default     = "data-delivery-raw-bucket"
}

variable "cleaned_bucket" {
  description = "Name of the cleaned S3 bucket"
  default     = "data-delivery-cleaned-bucket"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "lambda_zip_file" {
  description = "Path to the Lambda deployment zip file"
  default     = "../lambda/data_cleaner/data_cleaner.zip"
}


