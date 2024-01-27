output "acm_id" {
  value = aws_acm_certificate.acm_cert.id

}

output "acm_arn" {
  value = aws_acm_certificate.acm_cert.arn

}

output "acm_domain_validation_options" {
  value = aws_acm_certificate.acm_cert.domain_validation_options

}


