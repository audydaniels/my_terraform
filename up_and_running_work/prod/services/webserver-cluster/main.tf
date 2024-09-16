module "prd_web_cluster" {
    source = "../../../modules/services/webserver-cluster"
    
    server_port = "8080"
    alb_port =  "80"
    tag_header = "prd-UaR"
    
    cluster_name = "prd-AJD-cluster"
    
    db_remote_state_bucket = "ajd-up-and-running-state"
    db_remote_state_key = "stage/data-stores/mysql/terraform.tfstate"
    
    vpc_remote_state_bucket = "ajd-up-and-running-state"
    vpc_remote_state_key = "global/vpc/terraform.tfstate"
  
  
}