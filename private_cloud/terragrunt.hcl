remote_state {
  backend = "s3"

  config = {
    bucket               = local.bucket
    workspace_key_prefix = "private_cloud"
    key                  = "terraform.state"
    region               = local.aws_region
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
