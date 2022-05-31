output "TEST_AWS_ACCESS_KEY" {
    value = aws_iam_access_key.role_delegation_test.id
}

output "TEST_AWS_SECRET_KEY" {
    value = aws_iam_access_key.role_delegation_test.secret
    sensitive = true
}

output "TEST_AWS_ROLE_ARN" {
  value = aws_iam_role.role_delegation_test.arn
}

output "TEST_AWS_EXTERNAL_ID" {
    value = random_string.external_id.id
}
