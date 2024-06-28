variable "bucket_name" {
  type        = string
  description = "Name of the bucket."
}
variable "cloudflare_email" {
  type        = string
  description = "Email address for the Cloudflare account."
}

variable "cloudflare_api_key" {
  type        = string
  description = "API key for the Cloudflare account."
}