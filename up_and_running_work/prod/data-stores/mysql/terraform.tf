terraform {
  backend "s3" {
    bucket = "ajd-up-and-running-state"
    key = "prd/data-stores/mysql/terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "terraform-up-and-running-locks"
    encrypt = true
    
  }
  
  
}


data "terraform_remote_state" "vpc" {
    backend = "s3"
    
    config = {
        bucket  = var.remote_state_bucket
        key = var.vpc_remote_state_key
        region = "us-east-2"    
    }

    
  
}