provider "aws" {
  region = "us-east-2"

}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "ajd-up-and-running-state"

  lifecycle {
    prevent_destroy = false
  }

  versioning {
    enabled = true
  }


}


resource "aws_s3_bucket_server_side_encryption_configuration" "db_encryption" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "aws:kms"

    }
  }

}


resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-up-and-running-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}


