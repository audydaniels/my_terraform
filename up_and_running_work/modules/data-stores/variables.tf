variable "db_password" {
    type = string
    description = "The password for the database"
  
}


variable "subnets_ids" {
    description = "subnet ids from vpc"
    type = list
  
}

variable "env" {
    description = "prefix for environment name"
    type = string
    
  
}