resource "aws_lb" "backend-alb" {
  name               = "${local.common_name}-backend-alb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [local.backend_alb_sg_id]
  subnets            = local.private_subnet_ids


  tags = merge(
    {
      Name = "${local.common_name}-backend-alb"
    },
    local.common_tags
  )
}

resource "aws_lb_listener" "backend-alb-listener" {
  load_balancer_arn = aws_lb.backend-alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/html"
      message_body = "<h1>Backend ALB is working</h1>"
      status_code  = "200"
    }
  }
}

resource "aws_route53_record" "backend-alb" {
  zone_id = "Z026504233SANXQ4H9YRL"
  name    = "*.backend-alb.devopstech.shop"
  type    = "A"
  allow_overwrite = true

alias {
    name                   = aws_lb.backend-alb.dns_name
    zone_id                = aws_lb.backend-alb.zone_id
    evaluate_target_health = true
  }
}
