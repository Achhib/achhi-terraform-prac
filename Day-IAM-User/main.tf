#IAM user creation
resource "aws_iam_user" "iamuser" {
    name = var.iam_user_value
  
}

# IAM Policy for S3 full Access
resource "aws_iam_policy" "s3_fullaccess" {
  name        = "${var.iam_user_value}_s3_policy"
  description = "Allow S3 access for ${var.iam_user_value}"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Sid": "VisualEditor0"
        Effect   = "Allow"
        Action   = ["s3:*"]
        Resource = ["*"]
      }
    ]
  })
}

# Attach the policy to the user
resource "aws_iam_user_policy_attachment" "iamuser_policy_attachment" {
  user       = aws_iam_user.iamuser.name
  policy_arn = aws_iam_policy.s3_fullaccess.arn
}
