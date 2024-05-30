resource "aws_acm_certificate" "acm_cert" {
  domain_name       = var.acm_domain
  subject_alternative_names = ["*.${var.acm_domain}"]
  validation_method = "DNS"

  tags = {
    Environment = var.acm_tag
  }

  lifecycle {
    create_before_destroy = true
  }
}