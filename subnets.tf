resource "aws_subnet" "public-a" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "${var.vpc_cidr}.0.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.aws_region}a"
  tags = {
    Name = "bootcamp-public-subnetA"
  }
}


resource "aws_subnet" "web-private-a" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "${var.vpc_cidr}.1.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "${var.aws_region}a"
  tags = {
    Name = "bootcamp-web-private-subnetA"
  }
}

resource "aws_subnet" "web-private-b" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "${var.vpc_cidr}.2.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "${var.aws_region}b"
  tags = {
    Name = "bootcamp-web-private-subnetB"
  }
}



resource "aws_subnet" "app-private-a" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "${var.vpc_cidr}.3.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "${var.aws_region}a"
  tags = {
    Name = "bootcamp-app-private-subnetA"
  }
}

resource "aws_subnet" "app-private-b" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "${var.vpc_cidr}.4.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "${var.aws_region}a"
  tags = {
    Name = "bootcamp-app-private-subnetB"
  }
}

resource "aws_subnet" "db-private-a" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "${var.vpc_cidr}.5.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "${var.aws_region}a"
  tags = {
    Name = "bootcamp-db-private-subnetA"
  }
}

resource "aws_subnet" "db-private-b" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "${var.vpc_cidr}.6.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "${var.aws_region}b"
  tags = {
    Name = "bootcamp-db-private-subnetB"
  }
}

resource "aws_subnet" "bastion-public-a" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "${var.vpc_cidr}.7.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.aws_region}b"
  tags = {
    Name = "bootcamp-bastion-public-subnetA"
  }
}
