data "terraform_remote_state" "vpc" {
  backend = "s3"
  config {
    region = "ap-southeast-1"
    key    = "prod/vpc/terraform.tfstate"
    bucket = "vpc-prod-terraform-remote-state"
  }
}

data "terraform_remote_state" "iam" {
  backend = "s3"
  config {
    encrypt = "true"
    bucket  = "iam-role-terraform-remote-state"
    key     = "global/iam/terraform.tfstate"
    region  = "ap-southeast-1"
  }
}

data "terraform_remote_state" "secgr" {
  backend = "s3"
  config {
    encrypt = "true"
    bucket  = "sec-group-prod-terraform-remote-state"
    key     = "prod/services/sec-group/terraform.tfstate"
    region  = "ap-southeast-1"
  }
}