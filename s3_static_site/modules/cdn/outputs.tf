output "output_cdn_arn" {
  value = aws_cloudfront_distribution.s3_distribution.arn

}

output "origin_access_controle_id" {

  value = aws_cloudfront_origin_access_control.origin_access_control.id

}

output "origin_access_controle_etag" {
  value = aws_cloudfront_origin_access_control.origin_access_control.etag

}

output "out_cdn_dis_name" {
  value = data.aws_cloudfront_distribution.cdn_dis_name.domain_name

}
