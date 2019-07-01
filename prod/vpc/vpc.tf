module "prod_vpc" {
  source     = "../../modules/aws-vpc"
  create_vpc = true
  name       = "prod"
  cidr_block = "10.0.0.0/16"
}
