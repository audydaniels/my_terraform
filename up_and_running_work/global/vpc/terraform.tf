
terraform {
    backend "s3" {
        bucket  = "ajd-up-and-running-state"
        key = "global/vpc/terraform.tfstate"
        region = "us-east-2"
    }
}


