resource "aws_iam_role" "ec2_s3_role" {
  name = "ec2-s3-access-role-demo"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Name = "ec2-s3-access-role-demo"
  }
}

resource "aws_iam_policy" "s3_access_policy" {
  name        = "ec2-s3-bucket-access-policy-demo"
  description = "Allow EC2 to access specific S3 bucket"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject",
          "s3:ListBucket"
        ],
        Effect   = "Allow",
        Resource = [
          aws_s3_bucket.terraform_demo.arn,
          "${aws_s3_bucket.terraform_demo.arn}/*"
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ec2_s3_attach" {
  role       = aws_iam_role.ec2_s3_role.name
  policy_arn = aws_iam_policy.s3_access_policy.arn
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2-s3-instance-profile-demo"
  role = aws_iam_role.ec2_s3_role.name
}
