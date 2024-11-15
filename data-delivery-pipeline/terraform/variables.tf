variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "raw_bucket_name" {
  description = "Name of the raw S3 bucket"
  default     = "data-delivery-raw-bucket"
}

variable "cleaned_bucket_name" {
  description = "Name of the cleaned S3 bucket"
  default     = "data-delivery-cleaned-bucket"
}



variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}
