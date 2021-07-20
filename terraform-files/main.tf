module "static-site" {
  source = "./modules/static-website"

  region              = var.region
  domain-name         = var.domain-name
  subdomain           = var.subdomain
  index-file-path     = var.index-file-path
  error-file-path     = var.error-file-path
  css-file-path       = var.css-file-path
}