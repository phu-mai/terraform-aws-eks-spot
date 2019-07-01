module "eks-iam" {
  source = "../../modules/aws-iam"
  create_iam = true
}
resource "aws_iam_instance_profile" "profile_node" {
  name = "eks-node"
  role = "${module.eks-iam.eks_node_name}"
}