resource "aws_s3_bucket" "s3-bucket-backend" {
  bucket = var.s3_bucket_name
}

resource "aws_s3_bucket_acl" "s3-bucket-backend-acl" {
  bucket = aws_s3_bucket.s3-bucket-backend.id
  acl = "private"
}

resource "aws_s3_bucket_versioning" "s3-bucket-backend-versioning" {
  bucket = aws_s3_bucket.s3-bucket-backend.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_object" "terraform_folder" {
  bucket = aws_s3_bucket.s3-bucket-backend.id
  key    = "terraform_backend/"
}

resource "aws_codecommit_repository" "infra-vpc-codecommit-repo" {
  repository_name = var.codecommit_repository_name
  description = "CodeCommit Repository to store VPC infra terraform codes."
}