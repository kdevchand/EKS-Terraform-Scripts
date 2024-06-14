output "worker_role_arn" {
  value = aws_iam_role.eks_worker_node_role.arn
}
