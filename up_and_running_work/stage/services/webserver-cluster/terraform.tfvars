


server_port  = "8080"
alb_port     = "80"
tag_header   = "UaR"
env          = "stg"
cluster_name = "AJD-cluster"
remote_state_bucket = "ajd-up-and-running-state"
db_remote_state_key = "stage/data-stores/mysql/terraform.tfstate"
vpc_remote_state_key = "global/vpc/terraform.tfstate"
instance_type = "t2.micro"
min_size = "2"
max_size = "4"