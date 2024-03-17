resource "aws_iam_role" "server_role" {
  name               = "bootcamp_server_role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
    "Effect": "Allow",
    "Sid": ""
    }
  ]
}
EOF
  tags = {
    Name  = "server_role",
    Owner = "bootcamp"
  }
}

resource "aws_iam_instance_profile" "server_profile" {
  name = "server_profile"
  role = aws_iam_role.server_role.name
}

resource "aws_iam_role_policy_attachment" "attach" {
  role       = aws_iam_role.server_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
}


