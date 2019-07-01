locals {
    secgr_id = "${aws_security_group.allow_all_protocol.id}"
}
output "secgr_id" {
  description = "The ID of the security group"
  value       = ["${local.secgr_id}"]
}