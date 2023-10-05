output "subnets-values" {
  #value = [ for range in aws_subnet.vpc3_subnets[each.key].cidr_block : range] 
  value = values(aws_subnet.vpc3_subnets)[*].cidr_block
}

output "subnet_names" {
  value = keys(aws_subnet.vpc3_subnets)[*]
}


# output "public_ip" {
#   value       = aws_instance.test.public_ip
#   description = "The public IP address of the web server"
# }

# output "ilb_public" {
#     value = aws_lb.example.ip_address
#     description = "The Public IP of the ILB"

# }

# output "ilb_dns" {
#   value       = aws_lb.example.dns_name
#   description = "The DNS name of LB"


# }




