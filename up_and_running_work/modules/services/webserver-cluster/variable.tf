variable "alb_port" {
  description = "inbound port for the ALB "
  type        = string
}

variable "server_port" {
  description = "bakend host port for healthceck"
  type        = string
}



variable "cluster_name" {
  description = "The name to use for all the cluster resources"
  type = string
}

variable "db_remote_state_bucket" {
  description = "The name of the S3 bucket for the database's remote state"
  type = string
  
}


variable "db_remote_state_key" {
  description = "The name of the S3 bucket for the database's remote state"
  type = string
  
}


variable "vpc_remote_state_bucket" {
  description = "The name of the vpc bucket for the database's remote state"
  type = string
  
}


variable "vpc_remote_state_key" {
  description = "The name of the vpc bucket for the database's remote state"
  type = string
  
}




variable "tag_header" {
  description = "add to all tags"
  type = string
  
}

variable "db_address" {
  description = "address for the mysql database"
  type = string
  
}

variable "db_port" {
  description = "address for the mysql database"
  type = string
  
}

variable "instance_acl" {
  description = "acl used for backend instances "
  type = string

}

variable "subnets_ids" {
  description = "list of subnet id's"
  type = list
}

variable "alb_acl" {
  description = "ALB acl for inbound access"
  type = string
  
}

variable "vpc_id" {
  description = "VPC ID "
  type = string
  
}