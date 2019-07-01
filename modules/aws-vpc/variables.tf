variable "create_vpc" {
  description = "If set to true, create a VPC for the system"
  default = false
}
variable "name" {
  description = "Name to be used on all the resources as identifier"
  default     = ""
}
variable "cidr_block" { 
  description = "(Required) The CIDR block for the VPC."
  default = "10.0.0.0/16"
}
