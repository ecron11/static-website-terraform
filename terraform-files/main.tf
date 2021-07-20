provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "web" {
  bucket = var.bucket-name
  acl    = "public-read"

  website {
    index_document = "index.html"
    error_document = "error.html"

    routing_rules = file("routing-rules.json")
  }
}

resource "aws_s3_bucket_policy" "static-website-policy" {
  bucket = aws_s3_bucket.web.id
  policy = jsonencode({
    Version = "2012-10-17"
    Id      = "STATIC-WEBSITE-POLICY"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource = [
          "arn:aws:s3:::${aws_s3_bucket.web.bucket}/*",
        ]
      }
    ]
  })
}

resource "aws_s3_bucket_object" "index" {
  bucket = aws_s3_bucket.web.id
  key    = "index.html"
  content_type = "text/html"
  source = var.index-file-path
}

resource "aws_s3_bucket_object" "error" {
  bucket = aws_s3_bucket.web.id
  key    = "error.html"
  content_type = "text/html"
  source = var.index-file-path
}

resource "aws_s3_bucket_object" "styles" {
  bucket = aws_s3_bucket.web.id
  key    = "styles.css"
  content_type = "text/css"
  source = var.css-file-path
}