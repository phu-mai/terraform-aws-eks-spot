variable "create_cluster" {
  description = "If set to true, create a EKS-Cluster for the system"
  default = false
}
variable "name" {
  description = "If set to true, create a EKS-Cluster for the system"
  default = "example"
}

variable "role_arn" {
  description = "If set to true, create a EKS-Cluster for the system"
}
variable "vpc_config" {
  description = "If set to true, create a EKS-Cluster for the system"
  default = []
}

variable "depends_on" {
  description = "If set to true, create a EKS-Cluster for the system"
  default = []
}
variable "security_group_ids" {
  description = "If set to true, create a EKS-Cluster for the system"
  default = []
}
variable "subnet_ids" {
  description = "If set to true, create a EKS-Cluster for the system"
  default = []
}