data "cloudflare_zones" "domain" {
  filter {
    name = var.bucket_name
  }
}

resource "cloudflare_record" "site_cname" {
  zone_id = data.cloudflare_zones.domain.zones[0].id
  name    = var.bucket_name
  value   = aws_s3_bucket_website_configuration.website_config.website_endpoint
  type    = "CNAME"

  ttl     = 1
  proxied = true
}

# resource "cloudflare_record" "www" {
#   zone_id = data.cloudflare_zones.domain.zones[0].id
#   name    = "www"
#   value   = var.bucket_name
#   type    = "CNAME"

#   ttl     = 1
#   proxied = true
# }


resource "cloudflare_page_rule" "https" {
  zone_id = data.cloudflare_zones.domain.zones[0].id
  target  = "*.${var.bucket_name}/*"
  actions {
    always_use_https = true
  }
}
