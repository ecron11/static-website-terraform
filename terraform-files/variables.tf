# Each object in the map represents a subdomain of the website. The key should be the region
variable "subdomains" {
  type = map(object({
    region          = string
    domain-name     = string
    subdomain       = string
    index-file-path = string
    error-file-path = string
    css-file-path   = string
  }))
}

variable "region" {
  type = string
}