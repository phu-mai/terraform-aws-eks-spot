module "global_variables" {
  source = "../../../global/credential"
}

provider "aws" {
  access_key = "${module.global_variables.access_key}"
  secret_key = "${module.global_variables.secret_key}"
  region     = "ap-southeast-1"
}

terraform {
  backend "s3" {
    encrypt = "true"
    bucket = "sec-group-prod-terraform-remote-state"
    key = "prod/services/sec-group/terraform.tfstate"
    region = "ap-southeast-1"
  }
}