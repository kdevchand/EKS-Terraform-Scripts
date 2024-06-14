resource "aws_nat_gateway" "eks_nat_gw" {
  allocation_id = var.allocation_id
  subnet_id     = var.subnet_id

  tags = {
    Name = "Nat gw"
  }

#  depends_on = [aws_internet_gateway.eks_igw]
  depends_on = [var.allocation_id]
}
