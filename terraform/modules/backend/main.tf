resource "aws_s3_bucket" "tfstate_bucket" {
  bucket = var.s3_tfstate.bucket
  versioning {enabled = true}
}

output "TFSTATE_BUCKET_NAME" {
  value = aws_s3_bucket.tfstate_bucket.bucket
}
