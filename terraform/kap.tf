resource "aws_iam_user" "kap_user" {
  name = "kap-user"
}

resource "aws_iam_access_key" "kap_user" {
  user = aws_iam_user.kap_user.name
}

resource "aws_iam_user_policy" "kap_user" {
  name = "kap-user-policy"
  user = aws_iam_user.kap_user.name

  policy = data.aws_iam_policy_document.kap_user_policy_document.json
}

data "aws_iam_policy_document" "kap_user_policy_document" {
  statement {
    effect    = "Allow"
    actions   = ["s3:PutObject"]
    resources = ["${module.image_hosting.arn}/*"]
  }
}

output "aws_access_key_id" {
  description = "aws access key id for Kap"
  value       = aws_iam_access_key.kap_user.id
}

output "region" {
  description = "aws region for Kap"
  value       = local.region
}
