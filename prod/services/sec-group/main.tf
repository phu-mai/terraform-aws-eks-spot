data "terraform_remote_state" "vpc" {
  backend = "s3"
  config {
    region = "ap-southeast-1"
    key    = "prod/vpc/terraform.tfstate"
    bucket = "vpc-prod-terraform-remote-state"
  }
}

module "eks-secgroup" {
  source      = "../../../modules/aws-security-group"
  sec_create  = true
  name        = "allow-all"
  vpc_id      = "${data.terraform_remote_state.vpc.vpc_id}"
}