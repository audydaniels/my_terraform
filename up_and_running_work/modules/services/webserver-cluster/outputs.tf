

output "LoadBalancer_dns" {
  value       = aws_lb.example.dns_name
  description = "The DNS name of LB"


}


# {for <KEY>, <VALUE> in <MAP> : <OUTPUT_KEY> => <OUTPUT_VALUE>}



