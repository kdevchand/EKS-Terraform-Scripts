variable "region" {
  description = "The AWS region to deploy to"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "Public subnet definitions"
  type = list(object({
    name = string
    cidr = string
    az   = string
  }))
  default = [
    { name = "Public subnet 1", cidr = "10.0.1.0/24", az = "us-east-1a" },
    { name = "Public subnet 2", cidr = "10.0.2.0/24", az = "us-east-1b" }
  ]
}

variable "private_subnets" {
  description = "Private subnet definitions"
  type = list(object({
    name = string
    cidr = string
    az   = string
  }))
  default = [
    { name = "Private subnet 1", cidr = "10.0.3.0/24", az = "us-east-1a" },
    { name = "Private subnet 2", cidr = "10.0.4.0/24", az = "us-east-1b" }
  ]
}

variable "instance_types" {
  description = "List of instance types for the node group"
  type        = list(string)
  default     = ["t3.small", "t3.medium", "t3.large"]
}

variable "instance_name_mapping" {
  description = "Mapping of instance names to types"
  type        = map(string)
  default = {
    "t3.small"  = "Small Instance"
    "t3.medium" = "Medium Instance"
    "t3.large"  = "Large Instance"
  }
}
