variable "db_password" {
    type = string
    description = "The password for the database"
  
}

variable "remote_state_bucket" {
  description = "The name of the vpc bucket for the database's remote state"
  type = string
  
}

variable "vpc_remote_state_key" {
  description = "The name of the vpc bucket for the database's remote state"
  type = string
  
}

variable "env" {
    description = "The enviornment resource is being built for"
    type = string
}