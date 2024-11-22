module "s3_raw_bucket" {
  source      = "../modules/s3-bucket"
  bucket_name = var.raw_bucket
  environment = var.environment
}

module "s3_cleaned_bucket" {
  source      = "../modules/s3-bucket"
  bucket_name = var.cleaned_bucket
  environment = var.environment
}

module "iam_roles" {
  source         = "../modules/iam-roles"
  raw_bucket     = var.raw_bucket
  cleaned_bucket = var.cleaned_bucket
}

module "lambda_function" {
  source                      = "../modules/lambda-function"
  lambda_role_arn             = module.iam_roles.lambda_role_arn
  lambda_policy_attachment_id = module.iam_roles.lambda_policy_attachment_id
  lambda_zip_file             = var.lambda_zip_file
  raw_bucket                  = var.raw_bucket
  cleaned_bucket              = var.cleaned_bucket
}

