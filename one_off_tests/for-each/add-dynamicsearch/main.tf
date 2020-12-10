
provider "aws" {
  region = "us-east-2"
}


#resource "aws_resourcegroups_group" "resource-group" {
#   for_each = { for nk in local.groupname: nk.combinelist => nk } 
#     name = each.key
     
#       resource_query {
#       query = <<JSON

#{
#  "ResourceTypeFilters": [
#    "AWS::EC2::Instance"
#  ],
#  "TagFilters": [
#    {
#      "Key": "enviornment",
#      "Values": ["${local.filteroutenv[0]}"}"]
#      },
#    { "Key": "application",
#      "Values": ["mongo","mongodb","Mongo"]
#    }
#  ]
#}
#JSON
#  }
#}
