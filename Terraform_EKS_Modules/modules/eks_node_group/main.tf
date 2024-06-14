resource "aws_eks_node_group" "eks_node" {
  cluster_name    = var.cluster_name
  node_group_name = "eks_node"
  node_role_arn   = var.node_role_arn

  subnet_ids = var.private_subnet_ids

  scaling_config {
    desired_size = 3
    max_size     = 5
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

  instance_types = var.instance_types

  launch_template {
    id      = var.launch_template_name
    version = "$Latest"
  }
}
