resource "aws_s3_bucket" "web" {
  bucket = "${var.subdomain}.${var.domain-name}"
  acl    = "public-read"

  website {
    index_document = "index.html"
    error_document = "error.html"

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

# Route 53 settings
data "aws_route53_zone" "primary" {
  name = var.domain-name
}

resource "aws_route53_record" "subdomain" {
  zone_id = data.aws_route53_zone.primary.zone_id
  name    = "${var.subdomain}.${var.domain-name}"
  type    = "A"
  alias {
    name = aws_s3_bucket.web.website_domain
    zone_id = aws_s3_bucket.web.hosted_zone_id
    evaluate_target_health = true
  }
}