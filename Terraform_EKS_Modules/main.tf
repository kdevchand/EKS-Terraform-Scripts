provider "aws" {
  region = var.region
}

module "vpc" {
  source     = "./modules/vpc"
  cidr_block = var.vpc_cidr
}

module "subnets" {
  source          = "./modules/subnets"
  vpc_id          = module.vpc.vpc_id
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
}

module "igw" {
  source = "./modules/igw"
  vpc_id = module.vpc.vpc_id
}

module "eip_nat_gateway" {
  source        = "./modules/eip_nat_gateway"
  allocation_id = module.igw.igw_id
  subnet_id     = module.subnets.public_subnet_ids[0]
}

module "routes" {
  source             = "./modules/routes"
  vpc_id             = module.vpc.vpc_id
  igw_id             = module.igw.igw_id
  nat_gw_id          = module.eip_nat_gateway.nat_gw_id
  public_subnet_ids  = module.subnets.public_subnet_ids
  private_subnet_ids = module.subnets.private_subnet_ids
}

module "iam_cluster" {
  source = "./modules/iam_cluster"
}

module "eks_cluster" {
  source             = "./modules/eks_cluster"
  cluster_role_arn   = module.iam_cluster.cluster_role_arn
  private_subnet_ids = module.subnets.private_subnet_ids
  public_subnet_ids  = module.subnets.public_subnet_ids
  depends_on         = [module.iam_cluster]
}

module "iam_workers" {
  source = "./modules/iam_workers"
}

data "aws_ami" "eks_ami_1" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amazon-eks-node-1.26-*"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

data "aws_ami" "eks_ami_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amazon-eks-node-1.26-*"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

data "aws_ami" "eks_ami_3" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amazon-eks-node-1.26-*"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

module "eks_node_group" {
  source                = "./modules/eks_node_group"
  cluster_name          = module.eks_cluster.cluster_name
  node_role_arn         = module.iam_workers.worker_role_arn
  private_subnet_ids    = module.subnets.private_subnet_ids
  instance_types        = var.instance_types
  instance_name_mapping = var.instance_name_mapping
  ami_ids               = [data.aws_ami.eks_ami_1.id, data.aws_ami.eks_ami_2.id, data.aws_ami.eks_ami_3.id]
  launch_template_name  = "eks-launch-template"
  depends_on = [
    module.iam_workers,
    module.eks_cluster
  ]
}
