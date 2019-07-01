module "eks-subnet" {
  source            = "../../modules/aws-subnet"
  create_subnet     = true
  name              = "eks-cluster"
  newbits       = 4
  netnum            = 2
  vpc_id            = "${module.prod_vpc.vpc_id}"
  route_table_id    = "${module.prod_vpc.rtable_id}"
  cidr_block        = "${module.prod_vpc.cidr_block}"
  availability_zone = ["ap-southeast-1a","ap-southeast-1b","ap-southeast-1c"]
}