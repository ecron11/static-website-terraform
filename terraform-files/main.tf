module "static-site" {
  source = "./modules/static-website"

  region          = each.value.region
  domain-name     = each.value.domain-name
  subdomain       = each.value.subdomain
  index-file-path = each.value.index-file-path
  error-file-path = each.value.error-file-path
  css-file-path   = each.value.css-file-path

  for_each = var.subdomains
}