locals {
  common_tags = {
    Project     = var.project
    Environment = var.environment
  }
}

resource "aws_s3_bucket" "frontend" {
  bucket = "${var.project}-${var.environment}-frontend"
  tags   = local.common_tags
}

resource "aws_s3_bucket_public_access_block" "frontend" {
  bucket = aws_s3_bucket.frontend.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_website_configuration" "frontend" {
  bucket = aws_s3_bucket.frontend.id

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_policy" "public_read" {
  bucket = aws_s3_bucket.frontend.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Sid       = "PublicReadGetObject"
      Effect    = "Allow"
      Principal = "*"
      Action    = "s3:GetObject"
      Resource  = "${aws_s3_bucket.frontend.arn}/*"
    }]
  })

  depends_on = [aws_s3_bucket_public_access_block.frontend]
}

resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.frontend.id
  key          = "index.html"
  source       = "${path.module}/../../../app/frontend/index.html"
  content_type = "text/html"
  etag         = filemd5("${path.module}/../../../app/frontend/index.html")
}