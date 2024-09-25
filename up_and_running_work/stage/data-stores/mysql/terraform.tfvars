
remote_state_bucket = "ajd-up-and-running-state"
vpc_remote_state_key = "global/vpc/terraform.tfstate"
db_remote_state_key = "${var.env}/data-stores/mysql/terraform.tfstate"

env = "stg"