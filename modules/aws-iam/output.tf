
locals {
  eks_master_id   = "${aws_iam_role.eks-master.id}"
  eks_master_arn  = "${aws_iam_role.eks-master.arn}"
  eks_master_name = "${aws_iam_role.eks-master.name}"
  eks_node_id     = "${aws_iam_role.eks-node.id}"
  eks_node_arn    = "${aws_iam_role.eks-node.arn}"
  eks_node_name   = "${aws_iam_role.eks-node.name}"
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
