variable "subnet_id" {
  description = "The subnet ID where the NAT Gateway will be deployed"
  type        = string
}

variable "allocation_id" {
  description = "Allocation Id of eip"
  type        = string
}
