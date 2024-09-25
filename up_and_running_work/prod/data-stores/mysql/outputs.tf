output "address" {
    value = module.mysql_db.address
    description = "mysql database ip address Connect to the database at this endpoint"
}

output "port" {
    value = module.mysql_db.port
    description = "The port the database is listening on"
}

