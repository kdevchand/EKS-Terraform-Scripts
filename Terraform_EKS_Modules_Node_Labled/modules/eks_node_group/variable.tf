variable "cluster_name" {
  description = "The EKS cluster name"
  type        = string
}

variable "node_role_arn" {
  description = "The IAM role ARN for the worker nodes"
  type        = string
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "instance_types" {
  description = "List of instance types for the node group"
  type        = list(string)
}

variable "instance_name_mapping" {
  description = "Mapping of instance names to types"
  type        = map(string)
}

variable "ami_ids" {
  description = "List of AMI IDs"
  type        = list(string)
}

variable "launch_template_name" {
  description = "The name of the launch template to use for the EKS node group"
  type        = string
}

variable "node_labels" {
  description = "Labels to be applied to the EKS nodes"
  type        = map(string)
}
