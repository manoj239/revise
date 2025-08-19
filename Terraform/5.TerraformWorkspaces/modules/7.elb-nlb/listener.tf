resource "aws_lb_listener" "front_end_http" {
  load_balancer_arn = aws_lb.test.arn
  port              = "80"
  protocol          = "TCP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.test.arn
  }
}

resource "aws_lb_listener" "front_end_https" {
  load_balancer_arn = aws_lb.test.arn
  port              = "443"
  protocol          = "TLS"
  certificate_arn   = var.certificate_arn
  alpn_policy       = "None"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.test.arn
  }
}