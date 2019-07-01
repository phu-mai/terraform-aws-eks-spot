variable "create_subnet" {
  description = "If set to true, create a Subnet for the system"
  default = false
}
variable "name" {
  description = "Name to be used on all the resources as identifier"
  default     = ""
}
variable "cidr_block" { 
  description = "(Required) The CIDR block for the VPC."
  default = []
}

variable "availability_zone" { 
  description = "(Optional) The AZ for the subnet."
  default = [] 
}

variable "vpc_id" { 
  description = "(Required) The VPC ID."
}
variable "route_table_id" { 
  description = "(Required) The CIDR block for the VPC."

}
variable "newbits" { 
  description = "Maximum number of subnets that can be created. The variable is used for CIDR blocks calculation"
  default     = "6"
}
variable "netnum" { 
  description = "Maximum number of subnets that can be created. The variable is used for CIDR blocks calculation"
  default     = "2"
}
