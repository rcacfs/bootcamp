resource "aws_default_route_table" "route_table" {
  default_route_table_id = aws_vpc.vpc.default_route_table_id

  tags = {
    Name = "default_route_table_do_not_use"
  }
}

resource "aws_default_security_group" "security_group" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "default_security_group_do_not_use"
  }
}

resource "aws_default_network_acl" "nacl" {
  default_network_acl_id = aws_vpc.vpc.default_network_acl_id

  tags = {
    Name = "default_nacl_do_not_use"
  }
}

resource "aws_default_vpc_dhcp_options" "dhcp" {
  tags = {
    Name = "dhcp"
  }
}
