

# data "terraform_remote_state" "" {


# }

# data "terraform_remote_state" "db" {
#     backend = "s3"
    
#     config = {
#       bucket = "ajd-up-and-running-state"
#       key = "stage/data-stores/mysql/terraform.tfstate"
#       region = "us-east-2"
#     }
  
# }