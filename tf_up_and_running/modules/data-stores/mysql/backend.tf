terraform {
   backend "s3" {
     bucket	= "ajd-terraform-lab-stg"
     region 	= "us-east-2"
     key	= "terraform/stage/data-stores/mysql/terraform.tfstate"
   }
}

