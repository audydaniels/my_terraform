


# output "ilb_public" {
#     value = aws_lb.example.public_ip
#     description = "The Public IP of the ILB"

# }

output "LoadBalancer_dns" {
  value       = aws_lb.example.dns_name
  description = "The DNS name of LB"


}


# {for <KEY>, <VALUE> in <MAP> : <OUTPUT_KEY> => <OUTPUT_VALUE>}



