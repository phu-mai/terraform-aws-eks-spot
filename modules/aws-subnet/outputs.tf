
locals {
    association_route_id = "${aws_route_table_association.public.*.id}"
    subnet_id            = "${aws_subnet.public.*.id}"
}
output "association_route_id" {
  description = "The ID of the VPC"
  value       = ["${local.association_route_id}"]
}
output "subnet_id" {
  description = "The ID of the VPC"
  value       = ["${local.subnet_id}"]
}