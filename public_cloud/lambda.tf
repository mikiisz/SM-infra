resource "aws_iam_role" "service_role" {
  name = "exposed_service_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

/* TODO @malysz:
 * add lambda to VPC
 * add security groups
 * allow peering between different VPC networks
 */
resource "aws_lambda_function" "exposed_service_lambda" {
  filename      = "exposed_service_source_code.zip"
  function_name = "exposed_service"
  role          = aws_iam_role.service_role.arn
  handler       = "lambda_handler"

  source_code_hash = filebase64sha256("exposed_service_source_code.zip")

  runtime = "python3.8"
}