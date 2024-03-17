resource "aws_network_acl" "nacl_public" {
  vpc_id = aws_vpc.vpc.id

  egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  subnet_ids = [
    aws_subnet.public-a.id
  ]

  tags = {
    Name = "bootcamp-public-nacl"
  }
}

resource "aws_network_acl" "web_private_nacl" {
  vpc_id = aws_vpc.vpc.id

  egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  subnet_ids = [
    aws_subnet.web-private-a.id,
    aws_subnet.web-private-b.id,
  ]

  tags = {
    Name = "bootcamp-web-private-nacl"
  }
}

resource "aws_network_acl" "app_private_nacl" {
  vpc_id = aws_vpc.vpc.id

  egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  subnet_ids = [
    aws_subnet.app-private-a.id,
    aws_subnet.app-private-b.id,
  ]

  tags = {
    Name = "bootcamp-app-private-nacl"
  }
}

resource "aws_network_acl" "db-private-nacl" {
  vpc_id = aws_vpc.vpc.id

  egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  subnet_ids = [
    aws_subnet.db-private-a.id,
    aws_subnet.db-private-b.id,
  ]

  tags = {
    Name = "bootcamp-db-private-nacl"
  }
}

resource "aws_network_acl" "bastion-public-nacl" {
  vpc_id = aws_vpc.vpc.id

  egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  subnet_ids = [
    aws_subnet.bastion-public-a.id,
  ]

  tags = {
    Name = "bootcamp-bastion-public-nacl"
  }
}
