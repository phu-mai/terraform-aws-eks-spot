module "eks-node-spot" {
  source                = "../../../modules/aws-eks-node"
  create_node           = true
  name                  = "${var.name}"
  eks_version           = "${module.eks-cluster.version}"
  endpoint              = "${module.eks-cluster.endpoint}"
  certificate_authority = "${module.eks-cluster.certificate_authority}"
  security_groups       = ["${data.terraform_remote_state.secgr.secgr_id}"]
  vpc_zone_identifier   = ["${data.terraform_remote_state.vpc.subnet_id}"]
  iam_instance_profile  = "${data.terraform_remote_state.iam.node_iam_instance_profile}"
  node_config =  {
    name             = "spot"
    instance_count   = "2"
    ec2_type_1       = "m4.large"
    ec2_type_2       = "c3.large"
    on_demand_base_capacity                  = 0
    on_demand_percentage_above_base_capacity = 0
    spot_instance_pools                      = 2
  }
}