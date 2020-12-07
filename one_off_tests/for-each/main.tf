
provider "aws" {
  region = "us-east-2"
}

#locals {
#  here = {
#   for item in keys(var.environment):
#   var.environment[item] => "${var.application[*]}"}
#}



#resource "aws_resourcegroups_group" "test-mongo" {
#   for_each = "${local.here}"
#     name = "*"
  
  
#  resource_query {
#    query = file("test-mongo.json")
#  }
#}










