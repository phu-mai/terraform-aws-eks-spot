locals {
  arn         = "${module.prod_vpc.arn}"
  cidr_block  = "${module.prod_vpc.cidr_block}"
  vpc_id      = "${module.prod_vpc.vpc_id}"
  rtable_id   = "${module.prod_vpc.rtable_id}"
  subnet_id   = "${module.eks-subnet.subnet_id}"
}
output "arn" {
  description = "The arn of the VPC"
  value       = ["${local.arn}"]
}
output "cidr_block" {
  description = "The cidr_block of the VPC"
  value       = ["${local.cidr_block}"]
}
output "vpc_id" {
  description = "The vpc_id of the VPC"
  value       = "${local.vpc_id}"
}
output "rtable_id" {
  description = "The rtable_id of the VPC"
  value       = "${local.rtable_id}"
}
output "subnet_id" {
  description = "The ID of the VPC"
  value       = ["${local.subnet_id}"]
}