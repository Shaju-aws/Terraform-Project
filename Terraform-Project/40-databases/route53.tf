resource "aws_route53_record" "mongodb" {
  zone_id = "Z026504233SANXQ4H9YRL"
  name    = "mongodb.${var.domain_name}"
  type    = "A"
  ttl     = "1"
  records = [aws_instance.mongodb.private_ip]
  allow_overwrite = true
}

# resource "aws_route53_record" "mongodb" {
#   zone_id = var.zone_id
#   name    = "mongodb-${var.environment}.${var.domain_name}"
#   type    = "A"
#   ttl     = 1
#   records = [aws_instance.mongodb.private_ip]
#   allow_overwrite = true
# }