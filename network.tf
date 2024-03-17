resource "aws_eip" "eip" {
  tags = {
    Name = "nat_gateway_eip"
  }
}

resource "aws_nat_gateway" "nat_a" {
  depends_on = [
    aws_eip.eip
  ]
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public-a.id
  tags = {
    Name = "nat_gateway"
  }
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "internet_gateway"
  }
}
