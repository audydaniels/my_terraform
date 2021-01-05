provider "aws" {
  region = "us-east-2"
}

module "webserver_cluster" {
  source = "../../../modules/services/webserver-cluster"
  
  cluster_name = "web-severs-stg"
  db_remote_state_bucket = "ajd-terraform-lab-stg"
  db_remote_state_key = "terraform/stage/data-stores/mysql/terraform.tfstate"

}
