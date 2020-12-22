resource "aws_launch_configuration" "example" {
  image_id        	= "ami-0a91cd140a1fc148a"
  instance_type   	= "t2.micro"
  security_groups  	= ["${aws_security_group.to_instance.id}"]
  user_data       	= "${data.template_file.user_data.rendered}" 

  lifecycle {
    create_before_destroy = true 
  }
}

resource "aws_autoscaling_group" "example" {
  launch_configuration = "${aws_launch_configuration.example.id}"
  availability_zones   = "${data.aws_availability_zones.all.names}"  
  
  load_balancers       = ["${aws_elb.example.id}"]  
  health_check_type    = "ELB" #This tells the ASG to use the ELB's health check to determine if instance is healthy

  min_size = 2
  max_size = 5
  
  tag {
    key 		= "Name"
    value 		= "terraform-asg-example"
    propagate_at_launch = true
  }
}

resource "aws_elb" "example" {
  name		     = "terraform-asg-example"
  availability_zones = "${data.aws_availability_zones.all.names}"
  security_groups    = ["${aws_security_group.elb_sg.id}"]
  
  listener {
    lb_port 		= "${var.elb_port}"
    lb_protocol 	= "http"
    instance_port	= "${var.server_port}"
    instance_protocol   = "http"
  }  
  
  health_check {
    healthy_threshold	= 2
    unhealthy_threshold = 2
    timeout 		= 3 
    interval		= 30
    target 		= "HTTP:${var.server_port}/"
  }
  

}

data "terraform_remote_state" "db" {
  backend = "s3"
 
  config = {
    bucket 		= "ajd-terraform-lab"
    region 		= "us-east-2"
    key 		= "terraform/stage/data-stores/mysql/terraform.tfstate"
  }
}
    

data "template_file" "user_data" {
  template  = "${file("user-data.sh")}"

  vars = {
    server_port 	= "${var.server_port}"
    db_address 		= "${data.terraform_remote_state.db.outputs.db_ip}"
    db_port    		= "${data.terraform_remote_state.db.outputs.db_port}"
  }
}




