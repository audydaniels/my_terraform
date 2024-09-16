# terraform {
#   backend "s3" {
#     bucket = "ajd-up-and-running-state"
#     key = "global/s3/terraform.tfstate"
#     region = "us-east-2"

#     dynamodb_table = "terraform-up-and-running-locks"
#     encrypt = true

#   }


# }

data "terraform_remote_state" "db" {
  backend = "s3"

  config = {
    bucket = var.db_remote_state_bucket
    key    = var.db_remote_state_key
    region = "us-east-2"
  }
}



data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = var.vpc_remote_state_bucket
    key    = var.vpc_remote_state_key
    region = "us-east-2"
  }

}

