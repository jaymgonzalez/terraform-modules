resource "aws_s3_bucket_website_configuration" "website_config" {
  bucket = data.aws_s3_bucket.selected-bucket.bucket
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "index.html"
  }
}

resource "aws_s3_bucket_website_configuration" "www_website_config" {
  bucket = data.aws_s3_bucket.www-bucket.bucket
  redirect_all_requests_to {
    host_name = var.bucket_name
    protocol  = "https"
  }
}