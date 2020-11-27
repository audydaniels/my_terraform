provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "instance" {
 # description		= "Test host for resource group creation"
  ami			= "ami-0b0f4c27376f8aa79"
  instance_type 	= "t2.micro" 

  tags = {
    key			= "Name"
    value 		= "aa-1"
  }
}


resource "aws_instance" "instance2" {
 # description 		 = "Test host for resource group creation"
  ami          		 = "ami-0b0f4c27376f8aa79"
  instance_type 	 = "t2.micro"

  tags = { 
    key 	 = "Name"
    value	 = "aa-2"
  }
}


resource "aws_instance" "instance3" {
 # description   = "Test host for resource group creation"
  ami           = "ami-0b0f4c27376f8aa79"
  instance_type          = "t2.micro"

  tags = {
    key		= "Name"
    Name 	= "bb-1"
  }
}


resource "aws_resourcegroups_group" "test" {
  name = "test-group-A"
  
  resource_query {
    query = <<JSON
{
  "ResourceTypeFilters": [
    "AWS::EC2::Instance"
   ], 
   "TagFilters": [
     {  
       "key": "Name",
       "Values": ["aa*"]
     }
   ]
}
JSON
  }
}



