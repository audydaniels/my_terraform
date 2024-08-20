terraform {
  backend "s3" {
    bucket = "ajd-up-and-running-state"
    key = "global/s3/terraform.tfstate"
    region = "us-east-2"
    
    dynamodb_table = "terraform-up-and-running-locks"
    encrypt = true
    
  }
  

}

data "terraform_remote_state" "db" {
  backend = "s3"

  config = {
    bucket = "ajd-up-and-running-state"
    key = "stage/data-stores/mysql/terraform.tfstate"
    region  = "us-east-2"
  }
}
