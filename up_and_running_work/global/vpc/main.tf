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
    
}