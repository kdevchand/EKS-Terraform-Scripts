resource "aws_route_table" "public_subnet_route_table" {
  vpc_id = var.vpc_id

  tags = {
    Name = "Public subnet route table"
  }
}

resource "aws_route_table" "private_subnet_route_table" {
  vpc_id = var.vpc_id

  tags = {
    Name = "Private subnet route table"
  }
}

resource "aws_route" "private_subnet_nat_gateway_route" {
  route_table_id         = aws_route_table.private_subnet_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = var.nat_gw_id
}

resource "aws_route" "public_subnet_internet_gateway_route" {
  route_table_id         = aws_route_table.public_subnet_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = var.igw_id
}

resource "aws_route_table_association" "public_subnet_route_table_association" {
  count = length(var.public_subnet_ids)

  subnet_id      = var.public_subnet_ids[count.index]
  route_table_id = aws_route_table.public_subnet_route_table.id
}

resource "aws_route_table_association" "private_subnet_route_table_association" {
  count = length(var.private_subnet_ids)

  subnet_id      = var.private_subnet_ids[count.index]
  route_table_id = aws_route_table.private_subnet_route_table.id
}
