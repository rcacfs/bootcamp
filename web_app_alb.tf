resource "aws_lb" "web_alb" {
  name                       = "${var.alb_name}-web-alb"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.web-elb-security-group.id]
  subnets                    = [aws_subnet.public-a.id, aws_subnet.bastion-public-a.id]
  enable_http2               = true
  enable_deletion_protection = false


}

resource "aws_alb_listener" "web_port_80_listener" {
  load_balancer_arn = aws_lb.web_alb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }

}

resource "aws_lb_target_group" "app_target_group" {

  name                 = "${var.alb_name}-app-tg"
  protocol             = "HTTP"
  protocol_version     = "HTTP1"
  port                 = 80
  target_type          = "instance"
  deregistration_delay = 10
  vpc_id               = aws_vpc.vpc.id

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    port                = 80
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    protocol            = "HTTP"
    matcher             = "200"
  }

}

resource "aws_lb_target_group_attachment" "web_alb_attachment" {
  target_group_arn = aws_lb_target_group.app_target_group.arn
  target_id        = aws_instance.web-server.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "app_alb_attachment" {
  target_group_arn = aws_lb_target_group.app_target_group.arn
  target_id        = aws_instance.app-server.id
  port             = 80
}
