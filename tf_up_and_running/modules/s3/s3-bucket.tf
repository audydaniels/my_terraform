
provider "aws" {
  region = "us-east-2"
}     

resource "aws_s3_bucket" "remotestate" {
  bucket 	= "ajd-terraform-lab-stg"
  
  versioning {
    enabled 	= true
  }
  
  lifecycle {
    prevent_destroy = false
  }

}

