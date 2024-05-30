resource "aws_s3_bucket" "mys3" {
  bucket = var.mys3_bucket_name

  tags = {
    Name = var.mys3_bucket_tag
  }
}

resource "aws_s3_bucket_ownership_controls" "mys3oc" {
  bucket = aws_s3_bucket.mys3.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "mys3acl" {
  depends_on = [aws_s3_bucket_ownership_controls.mys3oc]

  bucket = aws_s3_bucket.mys3.id
  acl    = "private"
}

resource "aws_s3_bucket_policy" "mys3_policy" {
  bucket = aws_s3_bucket.mys3.id

  policy = templatefile("${path.module}/s3_policy.tpl", {
    mys3arn = aws_s3_bucket.mys3.arn
    cdnarn  = var.cdn_arn
  })
}
