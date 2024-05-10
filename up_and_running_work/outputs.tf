



output "public_ip" {
    value       = [ for k, v in aws_subnet.subnets :  aws_subnet.subnets[k].id] 
    #value = [values(aws_subnet.subnets)[*].cidr_block]

  description = "The public IP address of the web server"
}

# output "ilb_public" {
#     value = aws_lb.example.ip_address
#     description = "The Public IP of the ILB"

# }

output "ilb_dns" {
  value       = aws_lb.example.dns_name
  description = "The DNS name of LB"


}


# {for <KEY>, <VALUE> in <MAP> : <OUTPUT_KEY> => <OUTPUT_VALUE>}




