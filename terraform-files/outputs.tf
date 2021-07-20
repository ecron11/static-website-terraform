output "public-url" {
  value = aws_s3_bucket.web.website_endpoint 
}