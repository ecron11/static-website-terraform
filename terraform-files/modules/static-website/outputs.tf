output "s3-url" {
  value = aws_s3_bucket.web.website_endpoint
}
output "public-url" {
    value = aws_route53_record.subdomain.fqdn
}