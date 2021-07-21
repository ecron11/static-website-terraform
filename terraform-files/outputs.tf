output "url" {
  description = "The URLs of the static websites"
  # value       = module.static-site.*.public-url
  value = { for subdomain in keys(var.subdomains) : subdomain => module.static-site[subdomain].public-url }
}