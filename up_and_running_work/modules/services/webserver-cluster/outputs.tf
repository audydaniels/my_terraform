

output "LoadBalancer_dns" {
  value       = aws_lb.example.dns_name
  description = "The DNS name of LB"
}

output "asg_name" {
  description = "Auto scaling group name output"
  value       = aws_autoscaling_group.example.name

}


output "alb_acl" {
  value = aws_security_group.alb.id

}

output "instance_acl" {
  value = aws_security_group.instance.id

}


# {for <KEY>, <VALUE> in <MAP> : <OUTPUT_KEY> => <OUTPUT_VALUE>}



