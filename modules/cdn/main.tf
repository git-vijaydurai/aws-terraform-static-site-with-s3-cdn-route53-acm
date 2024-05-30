resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name              = var.mys3_bucket_regional_domain_name
    origin_access_control_id = aws_cloudfront_origin_access_control.origin_access_control.id
    origin_id                = var.mys3_bucket_domain_name

  }

  enabled = true


  default_root_object = "index.html"

  aliases = [
    "${var.myown_domain}"
  ]

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = var.mys3_bucket_domain_name

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
    compress               = true
    viewer_protocol_policy = "redirect-to-https"
  }
  price_class = "PriceClass_200"

  restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations        = ["US", "IN"]
    }
  }

  tags = {
    Environment = "dev"
  }

  viewer_certificate {

    cloudfront_default_certificate = false
    acm_certificate_arn            = var.acm_certificate_arn
    ssl_support_method             = "sni-only"
    minimum_protocol_version       = "TLSv1"

  }

}

resource "aws_cloudfront_origin_access_control" "origin_access_control" {
  name                              = "origin_access_control"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

data "aws_cloudfront_distribution" "cdn_dis_name" {

  id = aws_cloudfront_distribution.s3_distribution.id

}