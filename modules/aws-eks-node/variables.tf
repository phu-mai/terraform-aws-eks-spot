
variable "name" {
  description = "Define cluster name"
}
variable "create_node" {
  description = "If set to true, create a eks-node for the system"
  default = false
}
variable "eks_version" {
  description = "The version for your eks cluster."
}
variable "endpoint" {
  description = "The endpoint for your Kubernetes API server."
}
variable "certificate_authority" {
  description = "Attribute containing certificate-authority-data for your cluster."
}

variable "vpc_zone_identifier" {
  description = "The VPC zone identifier"
  type = "list"
}
variable "associate_public_ip_address" {
  description = "(Optional) Associate a public ip address with an instance in a VPC."
  default = true
}

variable "security_groups" {
  description = "(Optional) A list of associated security group IDS."
  type = "list"
}
variable "iam_instance_profile" {
  description = "(Optional) Number of Spot pools per availability zone to allocate capacity. EC2 Auto Scaling selects the cheapest Spot pools and evenly allocates Spot capacity across the number of Spot pools that you specify. Default: 2"
}
variable "node_config" {
  type = "map"

  default = {
    instance_count   = "1"
    ec2_type_1       = "c4.large"
    ec2_type_2       = "c3.large"
    name             = "general"

    on_demand_base_capacity                  = 0
    on_demand_percentage_above_base_capacity = 100
    spot_instance_pools                      = 1
  }

  description = "Desired eks nodes configuration."
# on_demand_base_capacity : (Optional) Absolute minimum amount of desired capacity that must be fulfilled by on-demand instances. Default: 0
# on_demand_percentage_above_base_capacity :(Optional) Percentage split between on-demand and Spot instances above the base on-demand capacity. Default: 100.
# spot_instance_pools (Optional) Number of Spot pools per availability zone to allocate capacity. EC2 Auto Scaling selects the cheapest Spot pools and evenly allocates Spot capacity across the number of Spot pools that you specify. Default: 2
}
variable "load_balancer_ids" {
  type        = "list"
  default     = []
  description = "A list of elastic load balancer names to add to the autoscaling group names. Only valid for classic load balancers. For ALBs, use target_group_arns instead."
}
variable "target_group_arns" {
  type        = "list"
  default     = []
  description = "A list of aws_alb_target_group ARNs, for use with Application Load Balancing."
}