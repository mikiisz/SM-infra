variable "aws_region" {}

terraform {
  backend "s3" {}
}

provider "aws" {
  region = var.aws_region
}
