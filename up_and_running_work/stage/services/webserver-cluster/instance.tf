

# resource "aws_instance" "test" {
#   ami                    = "ami-0430580de6244e02e"
#   instance_type          = "t2.micro"

#   subnet_id              =  "subnet-0911402c76c848f53"
#   vpc_security_group_ids = [data.terraform_remote_state.vpc.outputs.instance_acl]

#   user_data = <<-EOF
#         #!/bin/bash
#         echo "Hello, World" > index.html
#         nohup busybox httpd -f -p ${var.server_port} &
#         EOF

#   tags = {
#     Name = "Test intance"
#   }
# }


# resource "aws_eip" "test_eip" {
# instance = aws_instance.test.id


# }


## Launch Configurtion

resource "aws_launch_configuration" "example" {
  image_id        = "ami-0430580de6244e02e"
  instance_type   = "t2.micro"
  security_groups = [data.terraform_remote_state.vpc.outputs.instance_acl]


  user_data = templatefile("user-data.sh", { server_port = "${var.server_port}", db_address = data.terraform_remote_state.db.outputs.address, db_port = data.terraform_remote_state.db.outputs.port })

  lifecycle {
    create_before_destroy = true
  }

}







##### Autoscaling group ####

resource "aws_autoscaling_group" "example" {
  launch_configuration = aws_launch_configuration.example.name
  vpc_zone_identifier =  flatten(data.terraform_remote_state.vpc.outputs.subnets_ids)
  target_group_arns = [aws_lb_target_group.asg.arn]
  health_check_type = "ELB"

  name_prefix = "tf-up-and-running"
  min_size    = 2
  max_size    = 4



  tag {
    key                 = "Name"
    value               = "terraform-asg-example"
    propagate_at_launch = true

  }

}

data "template_file" "user_data" {
  template = file("user-data.sh")
  
  vars = {
    server_port = var.server_port
    db_address = data.terraform_remote_state.db.outputs.address
    db_port = data.terraform_remote_state.db.outputs.port
  
  }

  

}
