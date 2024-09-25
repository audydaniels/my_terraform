locals {
  http_port    = "80"
  any_port     = "0"
  any_protocol = "-1"
  tcp_protocol = "tcp"
  all_ips      = ["0.0.0.0/0"]
  my_public_ip = ["108.90.7.137/32"]
}



resource "aws_security_group" "alb" {
  description = "inbound access to application load balancer"

  name   = "${var.env}-alb-inbound"
  vpc_id = aws_vpc.vpc.id

  egress {
    from_port   = local.any_port
    to_port     = local.any_port
    protocol    = local.any_protocol
    cidr_blocks = local.all_ips
  }


  ingress {
    from_port   = var.alb_port
    to_port     = var.alb_port
    protocol    = local.tcp_protocol
    cidr_blocks = local.my_public_ip
  }


  tags = {
    Name = "${var.env}-${var.tag_header}-ILB-ACL"
  }

}



resource "aws_security_group" "instance" {
  description = "terraform-example-instance"
  vpc_id      = aws_vpc.vpc.id
  name        = "${var.env}-for_the_instance"


  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = local.tcp_protocol
    cidr_blocks = local.all_ips
  }

  egress {
    from_port   = local.any_port
    to_port     = local.any_port
    protocol    = -1
    cidr_blocks = local.all_ips


  }

  tags = {
    Name = "${var.env}-${var.tag_header}-for_the_instance"
  }

}


