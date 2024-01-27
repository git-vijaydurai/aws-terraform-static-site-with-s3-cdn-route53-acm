data "aws_route53_zone" "my53" {
  name         = var.my53_record_name
  private_zone = false
}

resource "aws_route53_record" "my53" {
  for_each = {
    for dvo in var.acm_domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.my53.zone_id

}

resource "aws_route53_record" "Route53RecordSet" {
    name = var.myown_domain_record_name
    type = "CNAME"
    ttl = 300
    records = [
        var.cdn_dis_domain_name
    ]
    zone_id = data.aws_route53_zone.my53.zone_id
}

resource "aws_acm_certificate_validation" "my53" {
  certificate_arn         = var.acm_arn
  validation_record_fqdns = [for record in aws_route53_record.my53 : record.fqdn]
}


