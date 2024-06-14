variable "vpc_id" {
  description = "The VPC ID"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnet definitions"
  type = list(object({
    name = string
    cidr = string
    az   = string
  }))
}

variable "private_subnets" {
  description = "List of private subnet definitions"
  type = list(object({
    name = string
    cidr = string
    az   = string
  }))
}
