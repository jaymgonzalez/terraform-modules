resource "aws_s3_bucket" "website-bucket" {
  bucket = var.bucket_name
}
data "aws_s3_bucket" "selected-bucket" {
  bucket = aws_s3_bucket.website-bucket.bucket
}