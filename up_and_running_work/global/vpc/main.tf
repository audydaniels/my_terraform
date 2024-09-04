resource "aws_vpc" "vpc" {
    cidr_block = "10.2.0.0/16"
    
    tags = {
    Name = "Terraform up and running work"
    }

}

resource "aws_subnet" "subnets" {
    for_each = var.vpc_subnets
    
    vpc_id = aws_vpc.vpc.id
    availability_zone = each.value.availability_zone
    cidr_block = each.value.cidr_block
    
    
    tags = {
      Name = "TUR-${each.key}"
    }
    
}



resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc.id
  
    tags = {
        Name = "Terraform up and running IGW"
    
    
    }
}


# resource "aws_route_table" "default_route" {
    
#     vpc_id = aws_vpc.vpc.id
#     route  {
#         cidr_block = "0.0.0.0/0"
#         gateway_id  = aws_internet_gateway.igw.id
#     }
    
    
#     tags = {
#       Name = "TUR Route table"
#     }
  
# }


resource "aws_default_route_table" "default" {
    default_route_table_id = aws_vpc.vpc.default_route_table_id
    
    
        route  {
        cidr_block = "0.0.0.0/0"
        gateway_id  = aws_internet_gateway.igw.id
    }
    
    
    tags = {
        Name = "TRU-default-routetable"
    
    }
    
    
    
  
}