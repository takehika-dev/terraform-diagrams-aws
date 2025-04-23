resource "random_id" "bucket_suffix" {
  byte_length = 8
}

resource "aws_s3_bucket" "terraform_demo" {
  bucket = "terraform-demo-bucket-${random_id.bucket_suffix.hex}"

  tags = {
    Name = "terraform-demo-bucket"
  }
}
