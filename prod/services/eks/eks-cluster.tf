module "eks-cluster" {
  source             = "../../../modules/aws-eks"
  create_cluster     = true
  name               = "${var.name}"
  role_arn           = "${data.terraform_remote_state.iam.eks_master_arn}"
  security_group_ids = ["${data.terraform_remote_state.secgr.secgr_id}"]
  subnet_ids         = ["${data.terraform_remote_state.vpc.subnet_id}"]
}
