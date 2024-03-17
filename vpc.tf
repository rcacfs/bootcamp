resource "aws_vpc" "vpc" {
  cidr_block           = "${var.vpc_cidr}.0.0/16"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  instance_tenancy     = "default"
  tags = {
    Name = "bootcamp_vpc"
  }
}
