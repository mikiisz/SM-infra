resource "aws_iam_role" "ec2_role" {
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "ec2_profile" {
  role = aws_iam_role.ec2_role.name
}

data "aws_iam_policy_document" "ec2_policy" {
  statement {
    actions   = [
      "lambda:*",
      "s3:*"
    ]
    resources = [
      "*"
    ]
  }
}

resource "aws_instance" "ec2" {
  ami           = "ami-0d5eff06f840b45e9"
  instance_type = "t2.micro"

  iam_instance_profile   = aws_iam_instance_profile.ec2_profile.name
  subnet_id              = data.aws_subnet.private_cloud_vpc_subnet.id
  vpc_security_group_ids = [
    aws_security_group.ec2_ssh_access_sg.id
  ]

  key_name = aws_key_pair.ec2_key_pair.key_name
}