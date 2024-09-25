

## Launch Configurtion

resource "aws_launch_configuration" "example" {
  image_id        = "ami-0430580de6244e02e"
  instance_type   = var.instance_type
  security_groups = [var.instance_acl]


  user_data = templatefile("${path.module}/user-data.sh", { server_port = "${var.server_port}", db_address = "${var.db_address}", db_port = "${var.db_port}" })

  lifecycle {
    create_before_destroy = true
  }

}




#"home/adaniels/Documents/repo/my_terraform/up_and_running_work/modules/services/webserver-cluster/user-data.sh")


##### Autoscaling group ####

resource "aws_autoscaling_group" "example" {
  launch_configuration = aws_launch_configuration.example.name
  vpc_zone_identifier  = flatten(var.subnets_ids)
  target_group_arns    = [aws_lb_target_group.asg.arn]
  health_check_type    = "ELB"

  name_prefix = "${var.env}-${var.cluster_name}"
  min_size    = var.min_size
  max_size    = var.max_size



  tag {
    key                 = "Name"
    value               = "${var.env}-${var.tag_header}-${var.cluster_name}"
    propagate_at_launch = true

  }

}

data "template_file" "user_data" {
  template = file("${path.module}/user-data.sh")

  vars = {
    server_port = var.server_port
    db_address  = var.db_address
    db_port     = var.db_port

  }



}