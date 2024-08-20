resource "aws_security_group" "instance" {
  name = "terraform-example-instance"
  vpc_id = aws_vpc.vpc3.id

  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

tags = {
  Name = "for_the_instance"
}


}


#ILB

resource "aws_security_group" "alb" {
  name = "terraform-example-alb"
  vpc_id = aws_vpc.vpc3.id


  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["108.90.7.137/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]

  }


  tags = {
    Name = "ILB-ACL"
  }


}


# ### test 

# resource "aws_security_group" "test_instance" {
#   name = "terraform-example-instance"
#   vpc_id = "vpc-2da56246"

#   ingress {
#     from_port   = var.server_port
#     to_port     = var.server_port
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]

#   }

# tags = {
#   Name = "for_the_test_instance"
# }


# }
