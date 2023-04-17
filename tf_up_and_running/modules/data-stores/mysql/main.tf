provider "aws" {
  region		= "us-east-2"
}

resource "aws_db_instance" "example" {
  engine 			= "mysql"
  allocated_storage		= "${var.storage}"
  instance_class 		= "${var.instance_class}"
  name 				= "${var.db_name}"
  username			= "${var.username}"
  password 			= "${var.db_password}"
#  final_snapshot_identifier 	= "DELETE ME"
}

