resource "aws_subnet" "public-a" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "${var.vpc_cidr}.0.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.aws_region}a"
  tags = {
    Name = "bootcamp-publica-subnet"
  }
}


resource "aws_subnet" "elb-web-public-a" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "${var.vpc_cidr}.1.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "${var.aws_region}a"
  tags = {
    Name = "bootcamp-elb-weba-public-subnet"
  }
}

resource "aws_subnet" "elb-web-public-b" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "${var.vpc_cidr}.2.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "${var.aws_region}b"
  tags = {
    Name = "bootcamp-elb-webb-public-subnet"
  }
}



resource "aws_subnet" "web-private-a" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "${var.vpc_cidr}.3.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "${var.aws_region}a"
  tags = {
    Name = "bootcamp-weba-private-subnet"
  }
}

resource "aws_subnet" "db-private-a" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "${var.vpc_cidr}.4.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "${var.aws_region}a"
  tags = {
    Name = "bootcamp-dba-private-subnet"
  }
}

resource "aws_subnet" "db-private-b" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "${var.vpc_cidr}.5.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "${var.aws_region}b"
  tags = {
    Name = "bootcamp-dbb-private-subnet"
  }
}

resource "aws_subnet" "bastion-public-a" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "${var.vpc_cidr}.6.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "${var.aws_region}a"
  tags = {
    Name = "bootcamp-bastiona-public-subnet"
  }
}
