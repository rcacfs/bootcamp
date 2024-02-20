resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "bootcamp-public-route-table"
  }
}

resource "aws_route_table_association" "public-subnet_a" {
  subnet_id      = aws_subnet.public-a.id
  route_table_id = aws_route_table.public-route-table.id
}


resource "aws_route_table" "elb-web-public-route-table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "bootcamp-elb-web-public-route-table"
  }
}

resource "aws_route_table_association" "elb-web-public-subnet-a" {
  subnet_id      = aws_subnet.elb-web-public-a.id
  route_table_id = aws_route_table.elb-web-public-route-table.id
}


resource "aws_route_table" "web-private-route-table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_a.id
  }

  tags = {
    Name = "bootcamp-web-private-route-table"
  }
}

resource "aws_route_table_association" "web-private-subnet-a" {
  subnet_id      = aws_subnet.web-private-a.id
  route_table_id = aws_route_table.web-private-route-table.id
}

resource "aws_route_table" "db-private-route-table" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "bootcamp-db-private-route-table"
  }
}

resource "aws_route_table_association" "db-private-subnet-a" {
  subnet_id      = aws_subnet.db-private-a.id
  route_table_id = aws_route_table.db-private-route-table.id
}

resource "aws_route_table" "bastion-public-route-table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "bootcamp-bastion-public-route-table"
  }
}

resource "aws_route_table_association" "bastion-subnet-a" {
  subnet_id      = aws_subnet.bastion-public-a.id
  route_table_id = aws_route_table.bastion-public-route-table.id
}
