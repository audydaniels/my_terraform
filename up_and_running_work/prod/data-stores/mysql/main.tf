


module "mysql_db" {
  source = "../../../modules/data-stores"
  env = var.env
  subnets_ids = data.terraform_remote_state.vpc.outputs.subnets_ids
  db_password = var.db_password
  
}