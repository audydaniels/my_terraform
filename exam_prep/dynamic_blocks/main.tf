terraform {
    required_providers {
      aws = {
       source = "hashicorp/aws"
       version = "3.59.0"
       }
    }
  
}

provider "aws" {
    region = "us-east-1"
  
}


# data "vpc" "main" {
#     vpc_id = 
  
# }



resource "aws_vpc" "main"{
    cidr_block = "172.31.0.0/16"
}



resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.main.id


  dynamic "ingress" {
    for_each = local.ingress
    content {
    description      = ingress.value.description
    from_port        = ingress.value.port
    to_port          = ingress.value.port
    protocol         = ingress.value.protocol
    cidr_blocks      = [aws_vpc.main.cidr_block]
    }
  }
  
  dynamic "egress" {
    for_each = local.egress
    content {
        description  = egress.value.description
        from_port        = egress.value.port
        to_port          = egress.value.port
        protocol         = egress.value.protocol
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    
    }
    
  }




   tags = {
    Name = "allow_tls"
  }

}
locals {
    
    ingress = [
        {
        port = 443
        description = "Port 443"
        protocol    = "tcp"
        },
        
        {
        port = 80
        description = "Port 80"
        protocol    = "tcp"
        }
        
        
        ]
    
    egress= [
        {
        port = 0
        description = "any port"
        protocol    = "-1"
        },
        
        {
        port = 3728
        description = "testing loop"
        protocol    = "tcp"
        }
        
    ]
    
    

}