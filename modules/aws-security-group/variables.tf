variable "vpc_id" {
  description = "Whether to create security group and all rules"
}
variable "name" {
  description = "(Optional, Forces new resource) The name of the security group. If omitted, Terraform will assign a random,unique name"
}
variable "sec_create" {
  default = false
}
