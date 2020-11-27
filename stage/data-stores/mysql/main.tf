provider "aws" {
  region		= "us-east-2"
}

resource "aws_db_instance" "example" {
  engine 			= "mysql"
  allocated_storage		= 10
  instance_class 		= "db.t2.micro"
  name 				= "example_database"
  username			= "admin"
  password 			= "${var.db_password}"
#  final_snapshot_identifier 	= "DELETE ME"
}

