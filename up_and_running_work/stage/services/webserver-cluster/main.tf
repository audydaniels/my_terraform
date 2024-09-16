



module "web_cluster" {
  source = "../../../modules/services/webserver-cluster"

  server_port = "8080"
  alb_port    = "80"
  tag_header  = "UaR"

  cluster_name = "AJD-cluster"

  db_remote_state_bucket = "ajd-up-and-running-state"
  db_remote_state_key    = "stage/data-stores/mysql/terraform.tfstate"

  vpc_remote_state_bucket = "ajd-up-and-running-state"
  vpc_remote_state_key    = "global/vpc/terraform.tfstate"
  db_address              = data.terraform_remote_state.db.outputs.address
  db_port                 = data.terraform_remote_state.db.outputs.port
  instance_acl            = data.terraform_remote_state.vpc.outputs.instance_acl
  subnets_ids             = data.terraform_remote_state.vpc.outputs.subnets_ids
  alb_acl                 = data.terraform_remote_state.vpc.outputs.alb_acl
  vpc_id                  = data.terraform_remote_state.vpc.outputs.vpc_id







}

