resource "aws_instance" "web-server" {
  ami                    = "ami-0c7217cdde317cfec"
  instance_type          = "t3.micro"
  key_name               = "web-server-bastion"
  subnet_id              = aws_subnet.web-private-a.id
  vpc_security_group_ids = [aws_security_group.web-app-security-group.id]
  iam_instance_profile   = aws_iam_instance_profile.server_profile.name

  tags = {
    Name = "web-server"
  }

  root_block_device {
    delete_on_termination = false
    encrypted             = true
    volume_size           = 20
    volume_type           = "gp3"
  }

}

resource "aws_instance" "app-server" {
  ami                    = "ami-0c7217cdde317cfec"
  instance_type          = "t3.micro"
  key_name               = "web-server-bastion"
  subnet_id              = aws_subnet.app-private-a.id
  vpc_security_group_ids = [aws_security_group.web-app-security-group.id]
  iam_instance_profile   = aws_iam_instance_profile.server_profile.name

  tags = {
    Name = "app-server"
  }

  root_block_device {
    delete_on_termination = false
    encrypted             = true
    volume_size           = 20
    volume_type           = "gp3"
  }

}

