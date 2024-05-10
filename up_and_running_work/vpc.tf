

resource "aws_vpc" "vpc3" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Terraform up and running work"
  }
}


resource "aws_subnet" "subnets" {
  vpc_id   = aws_vpc.vpc3.id
  for_each = var.vpc3_subnets


  cidr_block = each.value["cidr_block"]
  availability_zone = each.value["availability_zone"]
  
  tags = {
    name = each.key 
  }
}


resource "aws_internet_gateway" "internet_gw" {
  vpc_id = aws_vpc.vpc3.id
  
  tags = {
    name = "TF_up_and_running"
  }
  
}

# resource "aws_internet_gateway_attachment" "igw_attatchment" {
  
#   internet_gateway_id = aws_internet_gateway.internet_gw.id
#   vpc_id = aws_vpc.vpc3.id
  
# }

resource "aws_default_route_table" "tf_upandrunning_route_table" {
  default_route_table_id = aws_vpc.vpc3.default_route_table_id
  
  route  {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gw.id
  }
  
}