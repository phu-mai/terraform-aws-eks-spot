
locals {
    arn         = "${ aws_vpc.this.arn}"
    vpc_id      = "${aws_vpc.this.id}"
    cidr_block  = "${aws_vpc.this.cidr_block}"
    rtable_id   = "${aws_route_table.public.id}"
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