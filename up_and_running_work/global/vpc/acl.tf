
# resource "aws_security_group" "alb" {
#         description = "inbound access to application load balancer"

#     name = "alb-inbound"
#     vpc_id = aws_vpc.vpc.id
    
#     egress {
#         from_port = 0
#         to_port =   0
#         protocol = "-1"
#         cidr_blocks = ["0.0.0.0/0"]
#     }
  
  
#     ingress {
#         from_port = var.alb_port
#         to_port = var.alb_port
#         protocol = "tcp"
#         cidr_blocks = [var.my_public_ip]
#     }
    
    
#     tags = {
#       Name = "ILB-ACL" 
#     }
    
# }



# resource "aws_security_group" "instance" {
#     description = "terraform-example-instance"
#     vpc_id = aws_vpc.vpc.id
#     name = "for_the_instance"
    
    
#     ingress {
#         from_port = var.server_port
#         to_port = var.server_port
#         protocol = "tcp"
#         cidr_blocks = ["0.0.0.0/0"]
#     }
    
#     egress  {
#         from_port = 0
#         to_port = 0
#         protocol = -1
#         cidr_blocks = ["0.0.0.0/0"]
    
    
#     }
    
#     tags = {
#       Name = "for_the_instance"
#     }
  
# }


