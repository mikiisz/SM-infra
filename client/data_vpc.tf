data "aws_vpc" "private_cloud_vpc" {
  filter {
    name   = "tag:Name"
    values = ["private-cloud-vpc"]
  }
}

data "aws_subnet" "private_cloud_vpc_subnet" {
  vpc_id = data.aws_vpc.private_cloud_vpc.id

  filter {
    name   = "tag:Name"
    values = ["private-cloud-vpc-public-${var.aws_region}a"]
  }
}