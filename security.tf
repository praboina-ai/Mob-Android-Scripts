provider "aws" {
    region = "us-east-1"
}

resource "aws_s3_bucket" "android_security_logs" {
    bucket = "android-security-logs"
    acl    = "private"

    versioning {
        enabled = true
    }

    server_side_encryption_configuration {
        rule {
            apply_server_side_encryption_by_default {
                sse_algorithm = "AES256"
            }
        }
    }

    tags = {
        Name        = "AndroidSecurityLogs"
        Environment = "Production"
    }
}

resource "aws_iam_role" "android_security_role" {
    name = "android-security-role"

    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Action    = "sts:AssumeRole"
                Effect    = "Allow"
                Principal = {
                    Service = "ec2.amazonaws.com"
                }
            },
        ]
    })

    tags = {
        Name = "AndroidSecurityRole"
    }
}

resource "aws_iam_policy" "android_security_policy" {
    name        = "android-security-policy"
    description = "Policy for Android security operations"

    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Action   = ["s3:PutObject", "s3:GetObject"]
                Effect   = "Allow"
                Resource = "${aws_s3_bucket.android_security_logs.arn}/*"
            },
        ]
    })
}

resource "aws_iam_role_policy_attachment" "attach_policy" {
    role       = aws_iam_role.android_security_role.name
    policy_arn = aws_iam_policy.android_security_policy.arn
}