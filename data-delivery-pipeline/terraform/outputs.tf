output "raw_bucket" {
  description = "The name of the raw data S3 bucket"
  value       = module.s3_raw_bucket.bucket_name
}

output "raw_bucket_arn" {
  description = "The ARN of the raw data S3 bucket"
  value       = module.s3_raw_bucket.bucket_arn
}

output "cleaned_bucket" {
  description = "The name of the cleaned data S3 bucket"
  value       = module.s3_cleaned_bucket.bucket_name
}

output "cleaned_bucket_arn" {
  description = "The ARN of the cleaned data S3 bucket"
  value       = module.s3_cleaned_bucket.bucket_arn
}
