# output "subnets_spalt" {
#     value = aws_subnet.subnets[*]
# }

output "subnets_ids" {
    value = [for value in aws_subnet.subnets : value.id]
}

output "subnets_azs" {
    value = [for value in aws_subnet.subnets : value.availability_zone]
}


# output "alb_acl" {
#     value = aws_security_group.alb.id
  
# }

# output "instance_acl" {
#     value = aws_security_group.instance.id
  
# }


output "vpc_id" {
    value = aws_vpc.vpc.id

}





