module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.11.0"

  name = "private-cloud-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["${var.aws_region}a"]
  private_subnets = ["10.0.1.0/24"]
  public_subnets  = ["10.0.101.0/24"]
}
