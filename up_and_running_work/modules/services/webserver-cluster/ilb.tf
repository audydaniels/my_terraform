
resource "aws_lb" "example" {
  name               = "${var.env}-${var.cluster_name}"
  load_balancer_type = "application"
  subnets            = flatten(var.subnets_ids)
  security_groups    = [var.alb_acl]

  tags = {
    "Name" = "${var.env}-${var.tag_header}-${var.cluster_name}"
  }

}


resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.example.arn
  port              = var.alb_port
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"



    fixed_response {
      content_type = "text/plain"
      message_body = "404: page not found"
      status_code  = 404

    }

  }
}

resource "aws_lb_target_group" "asg" {
  name     = "${var.env}-${var.cluster_name}"
  port     = var.server_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id


  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 15
    timeout             = 3
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}



resource "aws_lb_listener_rule" "asg" {
  listener_arn = aws_lb_listener.http.arn
  priority     = 100

  condition {
    path_pattern {
      values = ["*"]
    }
  }

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.asg.arn
  }
}


