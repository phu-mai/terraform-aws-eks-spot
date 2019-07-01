
locals {
    endpoint = "${aws_eks_cluster.eks-cluster.endpoint}"
    certificate_authority = "${aws_eks_cluster.eks-cluster.certificate_authority.0.data}"
    version = "${aws_eks_cluster.eks-cluster.version}"
}
output "endpoint" {
  description = "The endpoint for your Kubernetes API server."
  value       = "${local.endpoint}"
}
output "certificate_authority" {
  description = "Nested attribute containing certificate-authority-data for your cluster."
  value       = "${local.certificate_authority}"
}
output "version" {
  description = "Nested attribute containing certificate-authority-data for your cluster."
  value       = "${local.version}"
}