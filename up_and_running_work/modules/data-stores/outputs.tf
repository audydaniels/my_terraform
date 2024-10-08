output "address" {
    value = aws_db_instance.mysql.address
    description = "mysql database ip address Connect to the database at this endpoint"
}

output "port" {
    value = aws_db_instance.mysql.port
    description = "The port the database is listening on"
}

