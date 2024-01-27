output "mys3_arn" {
  value = aws_s3_bucket.mys3.arn
}
output "mys3_id" {
  value = aws_s3_bucket.mys3.id
}

output "mys3_tags_all" {
  value = aws_s3_bucket.mys3.tags_all
}

output "mys3_bucket_domain_name" {
  value = aws_s3_bucket.mys3.bucket_domain_name
}

output "mys3_bucket_regional_domain_name" {
  value = aws_s3_bucket.mys3.bucket_regional_domain_name
}