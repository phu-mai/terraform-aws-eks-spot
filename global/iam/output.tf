
locals {
  eks_master_id   = "${module.eks-iam.eks_master_id}"
  eks_master_arn  = "${module.eks-iam.eks_master_arn}"
  eks_master_name ="${module.eks-iam.eks_master_name}"
  eks_node_id     = "${module.eks-iam.eks_node_id}"
  eks_node_arn    = "${module.eks-iam.eks_node_arn}"
  eks_node_name   = "${module.eks-iam.eks_node_name}"
  node_iam_instance_profile = "${aws_iam_instance_profile.profile_node.arn}"
}
output "eks_master_id" {
  description = "The name of the role."
  value       = "${local.eks_master_id}"
}
output "eks_master_arn" {
  description = "The Amazon Resource Name (ARN) specifying the role."
  value       = "${local.eks_master_arn}"
}
output "eks_master_name" {
  description = "The name of the role."
  value       = "${local.eks_master_name}"
}
output "eks_node_id" {
  description = "The name of the role."
  value       = "${local.eks_node_id}"
}
output "eks_node_arn" {
  description = "The Amazon Resource Name (ARN) specifying the role."
  value       = "${local.eks_node_arn}"
}
output "eks_node_name" {
  description = "The name of the role."
  value       = "${local.eks_node_name}"
}
output "node_iam_instance_profile" {
  description = "The name of the role."
  value       = "${local.node_iam_instance_profile}"
}
