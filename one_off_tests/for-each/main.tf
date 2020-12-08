
provider "aws" {
  region = "us-east-2"
}


resource "aws_resourcegroups_group" "resource-group" {
   for_each = { for nk in local.what: nk.name_key => nk } 
     name = each.key
  
  
  resource_query {
    query = file("test-mongo.json")
  }
}










