resource "aws_security_group" "elb_sg" {
  name		= "${var.cluster_name}-elb"

  ingress {
  from_port 	= 80
  to_port   	= 80
  protocol  	= "tcp"
  cidr_blocks	= ["${var.my_host}"]
  }

  egress {
  from_port	= 0
  to_port	= 0
  protocol	= "-1"
  cidr_blocks   = ["0.0.0.0/0"]
  }

}

resource "aws_security_group" "to_instance" {
  name 	           = "${var.cluster_name}-to_instance"
 
  ingress {
  from_port	   = 0
  to_port 	   = 0
  protocol	   = "-1"
  security_groups  = ["${aws_security_group.elb_sg.id}"]
  }
 
  egress {
  from_port        = 0
  to_port          = 0
  protocol         = "-1"
  cidr_blocks	   = ["0.0.0.0/0"]
  }
}


resource "aws_security_group" "instance" {
  name 		= "${var.cluster_name}-instance"

  ingress {
  from_port   	= var.server_port
  to_port       = var.server_port
  protocol      = "tcp"
  cidr_blocks   = [var.my_host]
  }
 
  lifecycle {
    create_before_destroy = true
  }
}

