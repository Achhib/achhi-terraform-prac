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
        Sid: "VisualEditor0"
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

# IAM Role creation
resource "aws_iam_role" "iamrole" {
  name = var.iam_role_value
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}
# IAM Assume Role Policy Document
data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

# Attach the policy to the role
resource "aws_iam_role_policy_attachment" "role_policy_attachment" {
  role       = aws_iam_role.iamrole.name
  policy_arn = aws_iam_policy.s3_fullaccess.arn
}