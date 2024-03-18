// Security group for the load balancer
resource "aws_security_group" "web-elb-security-group" {
  name        = "bootcamp-web-elb-public-security-group"
  description = "Allowing Web Traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allowing port 80 Inbound"
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allowing port 443 Inbound"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allowing All Traffic Outbound"
  }

  tags = {
    Name = "bootcamp-web-elb-public-security-group"
  }
}

// web and application servers security groups
resource "aws_security_group" "web-app-security-group" {
  name        = "bootcamp-web-app-private-security-group"
  description = "Allowing Web and App Traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allowing port 22 Inbound"
  }

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = ["${aws_security_group.web-elb-security-group.id}"]
    description     = "Allowing port 80 Inbound"
  }

  ingress {
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    security_groups = ["${aws_security_group.web-elb-security-group.id}"]
    description     = "Allowing port 443 Inbound"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allowing All Traffic Outbound"
  }

  tags = {
    Name = "bootcamp-web-private-security-group"
  }
}

// database security group
resource "aws_security_group" "db_security_group" {
  name        = "bootcamp-db-private-security-group"
  description = "Allowing db access"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = ["${aws_security_group.web-app-security-group.id}"]
    description     = "Allowing port 5432 Inbound"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allowing All Traffic Outbound"
  }

  tags = {
    Name = "bootcamp-db-private-security-group"
  }
}

// bastion host security group
resource "aws_security_group" "bastion-security-group" {
  name        = "bootcamp-bastion-public-security-group"
  description = "Allowing Inbound Traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allowing port 22 Inbound"
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allowing All Traffic Outbound"
  }

  tags = {
    Name = "bastion-public-security-group"
  }
}
