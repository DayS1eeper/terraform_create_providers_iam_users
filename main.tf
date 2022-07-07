resource "random_string" "external_id" {
  length = 10
  special = false
}


resource "aws_iam_user" "role_delegation_test" {
  name = "go_scal_role_delegation_test"
}

resource "aws_iam_access_key" "role_delegation_test" {
  user = aws_iam_user.role_delegation_test.name
}

resource "aws_iam_role" "role_delegation_test" {
  name = "go_scal_role_delegation_test"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          AWS = aws_iam_user.role_delegation_test.arn
        }
        Condition = {
          StringEquals = {
            "sts:ExternalId" = random_string.external_id.id
          }
        }
      },
    ]
  })
}

resource "google_service_account" "google_test" {
  account_id = "scalr_provider_provider_configuration_test_acc"
}

resource "google_service_account_key" "sa_key" {
  service_account_id = google_service_account.myaccount.name
}
