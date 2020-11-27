provider "aws" {
  region = "us-east-2"
}

resource "aws_vpc" "postgress" {
  cidr_block 		= "192.168.0.0/16"
  instance_tenancy 	= "default"
  enable_dns_support	= "true"
  enable_dns_hostnames	= "true"
  tags = {
    Name 		= "postgress-tag"
  }
}
 
resource "aws_internet_gateway" "db-gw" {
  vpc_id 	= aws_vpc.postgress.id
  
  tags	= {
    Name 	= "gw-tag"
  }
}


resource "aws_route_table" "public-rt-1" {
  vpc_id 	= aws_vpc.postgress.id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id  = aws_internet_gateway.db-gw.id
  }
  
  tags = {
    Name 	= "public-table-tag"
  }
}


resource "aws_route_table" "private-rt-1" {
  vpc_id 	= aws_vpc.postgress.id
  
  route {
    cidr_block = "0.0.0.0/0"
  }

  tags = {
    Name 	= "private-table-tag"
  }
}

resource "aws_subnet" "public-sn-1" {
  vpc_id     	= aws_vpc.postgress.id
  cidr_block	= "192.168.1.0/24"
 
  tags = {
    Name	= "public-sn-tag"
  }
}

resource "aws_subnet" "private-sn-1" {
  vpc_id	= aws_vpc.postgress.id
  cidr_block 	= "192.168.2.0/24"
  
  tags = {
    Name	= "private-sn-tag"
  }
}

resource "aws_route_table_association" "public-1" {
  subnet_id 		= aws_subnet.public-sn-1.id
  route_table_id	= aws_route_table.public-rt-1.id
}

resource "aws_route_table_association" "private-1" {
  subnet_id		= aws_subnet.private-sn-1.id
  route_table_id	= aws_route_table.private-rt-1.id
}
    

  
