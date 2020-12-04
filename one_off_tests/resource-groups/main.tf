
provider "aws" {
  region = "us-east-2"
}




variable "app_name" {
  type = "map"
  default = {
    "mongo"  = "MongoDB"
    "ump"    = "ump"
    "arb"    = "arb"
  }
}

variable "enviornment" {
  type = "map"
  default  = {
    "dev"       = "test"
    "devinit"   = "devint"
    "prod"      = "production"
  }
}


resource "aws_instance" "hosta" {
  ami 		= "ami-0b0f4c27376f8aa79"
  instance_type = "t2.micro"

  tags = {
    key	   	= "Name"
    Name   	= "aa-2"
    enviornment	= "prod"
    application = "Mongo"
  } 
}

resource "aws_instance" "hostb" {
  ami 			= "ami-0b0f4c27376f8aa79"
  instance_type 	= "t2.micro"

  tags = {
    key    	= "Name"
    Name   	= "bb-2"
    enviornment = "test"
    application = "mongo"
  }
}

resource "aws_instance" "hostc" {
  ami 			= "ami-0b0f4c27376f8aa79"
  instance_type        = "t2.micro"

  tags = {
    Key   	= "Name"
    Name   	= "cc-2"
    enviornment = "prod"
    application = "mongoDB"
  }

}



resource "aws_resourcegroups_group" "prod-mongo" {
  name = "prod-mango"

  resource_query {
    query = file("prod-mongo.json")
    
  }
}

resource "aws_resourcegroups_group" "test-mongo" {
  name = "test-mogo"

  resource_query {
    query = file("test-mongo.json")
  }

}


