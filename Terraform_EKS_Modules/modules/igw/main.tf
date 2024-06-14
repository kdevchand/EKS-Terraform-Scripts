resource "aws_internet_gateway" "eks_igw" {
  vpc_id = var.vpc_id

  tags = {
    Name = "vpc_igw"
  }
}
