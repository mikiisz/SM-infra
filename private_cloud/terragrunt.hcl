remote_state {
  backend = "s3"

  config = {
    bucket = local.bucket
    key    = "private-terraform.state"
    region = local.aws_region
  }
}

terraform {
  source = ".//."
}

locals {
  # update aws bucket name and aws region according to your aws source
  bucket     = "encrypted"
  aws_region = "encrypted"
}

inputs = {
  aws_region = local.aws_region
}
