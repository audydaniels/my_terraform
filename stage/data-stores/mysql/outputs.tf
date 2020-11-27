
output "db_ip" {
  description = "Database IP address"  
  value = "${aws_db_instance.example.address}"
}

output "db_port" {
  description = "Database Port"
  value = "${aws_db_instance.example.port}"
}
