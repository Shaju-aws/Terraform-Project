resource "aws_route53_record" "mongodb" {
  zone_id = "Z026504233SANXQ4H9YRL"
  name    = "mongodb.${var.domain_name}"
  type    = "A"
  ttl     = "1"
  records = [aws_instance.mongodb.private_ip]
  allow_overwrite = true
}

resource "aws_route53_record" "redis" {
  zone_id = "Z026504233SANXQ4H9YRL"
  name    = "redis.${var.domain_name}"
  type    = "A"
  ttl     = "1"
  records = [aws_instance.redis.private_ip]
  allow_overwrite = true
}

resource "aws_route53_record" "rabbitmq" {
  zone_id = "Z026504233SANXQ4H9YRL"
  name    = "rabbitmq.${var.domain_name}"
  type    = "A"
  ttl     = "1"
  records = [aws_instance.rabbitmq.private_ip]
  allow_overwrite = true
}