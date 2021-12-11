/* TODO @malysz:
 * allow communication from different VPCs
 * add VPC endpoint for s3
 */

resource "random_string" "id" {
  lower   = true
  upper   = false
  special = false
  length  = 8
}

resource "aws_s3_bucket" "private_bucket" {
  bucket = "private-bucket-v${random_string.id.result}"
  acl    = "private"
}