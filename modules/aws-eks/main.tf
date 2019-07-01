resource "aws_eks_cluster" "eks-cluster" {
  count      = "${var.create_cluster}"
  name       = "${var.name}"
  role_arn   = "${var.role_arn}"
  vpc_config {
    security_group_ids = ["${var.security_group_ids}"]
    subnet_ids         = ["${var.subnet_ids}"]
  }
}
