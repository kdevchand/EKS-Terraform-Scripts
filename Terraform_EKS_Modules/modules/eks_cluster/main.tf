resource "aws_eks_cluster" "abdu_cluster" {
  name     = "eks_cluster"
  role_arn = var.cluster_role_arn
  version  = "1.26"

  vpc_config {
    subnet_ids = concat(var.private_subnet_ids, var.public_subnet_ids)
  }

  #depends_on = [
  #  aws_iam_role_policy_attachment.eks_cluster_role_attachment
  #]
}
