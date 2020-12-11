
provider "aws" {
  region = "us-east-2"
}


resource "aws_resourcegroups_group" "resource-group" {
   for_each =  { for value in local.groupname :  
      value.combinelist =>  value }
      name = each.key
     
     
       resource_query {
       query = <<JSON

{
  "ResourceTypeFilters": [
    "AWS::EC2::Instance"
  ],
  "TagFilters": [
    {
      "Key": "enviornment",
      "Values": ["${each.value.env_key}"]
    },
    { "Key": "application",
      "Values": ["${each.value.app_key}"]
    }
  ]
}
JSON 

  }
}
