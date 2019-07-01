data "terraform_remote_state" "vpc" {
  backend = "s3"
  config {
    region = "ap-southeast-1"
    key    = "prod/vpc/terraform.tfstate"
    bucket = "vpc-prod-terraform-remote-state"
  }
}