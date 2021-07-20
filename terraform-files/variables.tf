variable "region" {
  type = string
  default = "us-west-1"
}

variable "bucket-name" {
  type = string
}
variable "index-file-path" {
  type = string
  default = "../web-files/index.html"
}
variable "error-file-path" {
  type = string
  default = "../web-files/error.html"
}
variable "css-file-path" {
  type = string
  default = "../web-files/styles.css"
}