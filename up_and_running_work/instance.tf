

# resource "aws_instance" "test" {
#   ami                    = "ami-0430580de6244e02e"
#   instance_type          = "t2.micro"
  
#   subnet_id              =  "subnet-06bcbbb8261a69d40"
#   vpc_security_group_ids = [aws_security_group.test_instance.id]

#   user_data = <<-EOF
#         #!/bin/bash
#         echo "Hello, World" > index.html
#         nohup busybox httpd -f -p ${var.server_port} &
#         EOF

#   tags = {
#     Name = "terraform-example"
#   }
# }


# resource "aws_eip" "test_eip" {
# instance = aws_instance.test.id

  
# }


## Launch Configurtion

resource "aws_launch_configuration" "example" {
  image_id        = "ami-0430580de6244e02e"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.instance.id]


  user_data = <<-EOF
        #!/bin/bash
        echo "Hello, World" > index.html
        nohup busybox httpd -f -p ${var.server_port} &
        EOF

  lifecycle {
    create_before_destroy = true
  }
  
}



##### Autoscaling group ####

resource "aws_autoscaling_group" "example" {
    launch_configuration = aws_launch_configuration.example.name
    vpc_zone_identifier = [for k, v in aws_subnet.subnets: aws_subnet.subnets[k].id]
    
    target_group_arns    = [aws_lb_target_group.asg.arn]
    health_check_type    = "ELB"
    
    name_prefix = "tf-up-and-running"
    min_size    = 2
    max_size    = 4



  tag {
    key                 = "Name"
    value               = "terraform-asg-example"
    propagate_at_launch = true

  }

}

