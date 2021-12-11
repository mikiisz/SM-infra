module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.11.0"

  name = "public-cloud-vpc"
  cidr = "10.1.0.0/16"

  azs             = ["${var.aws_region}a"]
  private_subnets = ["10.1.1.0/24"]
  public_subnets  = ["10.1.101.0/24"]
}
