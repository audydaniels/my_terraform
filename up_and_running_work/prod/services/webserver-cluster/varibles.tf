variable "cluster_name" {
  description = "The name to use for all the cluster resources"
  type = string
}

variable "server_port" {
  description = "The port used to talkt to the instances behind the load balancer"
  type = string
  
}


variable "alb_port" {
  description = "The port allowed inbound to the front end of the loadbalancer"
  type = string
  
}


variable "env" {
  description = "environment"
  type = string
  
}

variable "tag_header" {
  description = "add to all tags"
  type = string
  
}


variable "remote_state_bucket" {
    description = "bucket name"
    type = string
  
}

variable "db_remote_state_key" {
    description = "path to db statefile"
    type = string
  
}

variable "vpc_remote_state_key" {
    description = "path to vpc statefile"
    type = string
  
}

variable "instance_type" {
  description = "The type of EC2 Instance to run ex t2.micro"
  
}

variable "min_size" {
  description = "The minimum number of EC2 instances in ASG"
  
}

variable "max_size" {
  description = "The maximum number of EC2 insances in ASG"
}
