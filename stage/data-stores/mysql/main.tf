provider "aws" {
  region		= "us-east-2"
}

module "mysql" {
  source = "../../../modules/data-stores/mysql"


  storage 	 = "10"
  instance_class = "db.t2.micro"
  db_name 	 = "Module_DB"
  username	 = "admin"
  db_password	 = ""
}


