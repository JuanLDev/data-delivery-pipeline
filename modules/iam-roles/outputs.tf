output "lambda_role_arn" {
  value = aws_iam_role.lambda_exec_role.arn
}

output "lambda_policy_attachment_id" {
  value = aws_iam_role_policy_attachment.lambda_attach_policy.id
}
