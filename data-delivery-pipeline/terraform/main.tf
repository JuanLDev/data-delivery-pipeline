module "s3_raw_bucket" {
  source      = "../modules/s3-bucket"
  bucket_name = var.raw_bucket_name
  environment = var.environment
}

module "s3_cleaned_bucket" {
  source      = "../modules/s3-bucket"
  bucket_name = var.cleaned_bucket_name
  environment = var.environment
}

module "iam_roles" {
  source              = "../modules/iam-roles"
  raw_bucket_name     = var.raw_bucket_name
  cleaned_bucket_name = var.cleaned_bucket_name
}

module "lambda_function" {
  source                    = "../modules/lambda-function"
  lambda_role_arn           = module.iam_roles.lambda_role_arn
  lambda_policy_attachment_id = module.iam_roles.lambda_policy_attachment_id
  lambda_zip_file           = "${path.module}/../lambda/data_cleaner/data_cleaner.zip"
  raw_bucket                = var.raw_bucket_name
  cleaned_bucket            = var.cleaned_bucket_name
}
