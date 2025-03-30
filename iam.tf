provider "aws" {
    region = "us-east-1"
}

resource "aws_iam_role" "android_ec2_role" {
    name = "android-ec2-role"

    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Action = "sts:AssumeRole"
                Effect = "Allow"
                Principal = {
                    Service = "ec2.amazonaws.com"
                }
            }
        ]
    })
}

resource "aws_iam_policy" "android_ec2_policy" {
    name        = "android-ec2-policy"
    description = "Policy for Android EC2 instance"

    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Action = [
                    "s3:ListBucket",
                    "s3:GetObject",
                    "s3:PutObject"
                ]
                Effect   = "Allow"
                Resource = [
                    "arn:aws:s3:::your-android-app-bucket",
                    "arn:aws:s3:::your-android-app-bucket/*"
                ]
            },
            {
                Action = "logs:*"
                Effect = "Allow"
                Resource = "*"
            }
        ]
    })
}

resource "aws_iam_role_policy_attachment" "android_ec2_policy_attachment" {
    role       = aws_iam_role.android_ec2_role.name
    policy_arn = aws_iam_policy.android_ec2_policy.arn
}