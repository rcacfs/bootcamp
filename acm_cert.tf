resource "aws_acm_certificate" "cert" {
  domain_name       = "*.bootcamp.com"
  validation_method = "DNS"

  tags = {
    Name = "bootcamp-certificate"
  }

  lifecycle {
    create_before_destroy = true
  }
}
