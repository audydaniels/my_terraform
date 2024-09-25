



module "web_cluster" {
  source = "../../../modules/services/webserver-cluster"

  server_port = var.server_port
  alb_port    = var.alb_port
  tag_header  = var.tag_header
  env         = var.env
  cluster_name = var.cluster_name
  instance_type = var.instance_type
  min_size = var.min_size
  max_size = var.max_size
  db_address   = data.terraform_remote_state.db.outputs.address
  db_port      = data.terraform_remote_state.db.outputs.port
  instance_acl = data.terraform_remote_state.vpc.outputs.instance_acl
  subnets_ids  = data.terraform_remote_state.vpc.outputs.subnets_ids
  alb_acl      = data.terraform_remote_state.vpc.outputs.alb_acl
  vpc_id       = data.terraform_remote_state.vpc.outputs.vpc_id
}

