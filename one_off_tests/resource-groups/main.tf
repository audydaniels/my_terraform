
provider "aws" {
  region = "us-east-2"
}



#variable "app_name" {
#  type = "map"
#  default = {
#    "mogo"	= "MongoDB"
#  }
#}




resource "aws_instance" "hosta" {
  ami 	= "ami-0b0f4c27376f8aa79"
  instance_type = "t2.micro"

  tags = {
    key	   = "Name"
    Name   = "aa-2"
    enviornment	= "prod"
    Application = "Mongo"
  } 
}


resource "aws_resourcegroups_group" "prod-mongo" {
  name = "prod-mango"

  resource_query {
    query = file("query3.json")
    
  }
}

