locals {
    secgr_id = "${module.eks-secgroup.secgr_id}"
}
output "secgr_id" {
  description = "The ID of the security group"
  value       = ["${local.secgr_id}"]
}