


variable "cluster_name" {
  description = "The name to use for all the cluster resources"
  type        = string
}

variable "server_port" {
  description = "The port used to talkt to the instances behind the load balancer"
  type        = string

}


variable "alb_port" {
  description = "The port allowed inbound to the front end of the loadbalancer"
  type        = string

}

variable "alb_acl" {
  description = "The port allowed inbound to the front end of the loadbalancer"
  type        = string

}

variable "instance_acl" {
  description = "example host acl"
  type        = string

}


variable "env" {
  description = "environment"
  type        = string

}

variable "tag_header" {
  description = "add to all tags"
  type        = string

}

variable "db_address" {
  description = "address for the mysql database"
  type        = string

}

variable "db_port" {
  description = "address for the mysql database"
  type        = string

}


variable "subnets_ids" {
  description = "list of subnet id's"
  type        = list(any)
}


variable "vpc_id" {
  description = "VPC ID "
  type        = string

}


variable "instance_type" {
  description = "The type of EC2 Instance to run ex t2.micro"
  type        = string


}

variable "min_size" {
  description = "The minimum number of EC2 instances in ASG"
  type        = string


}

variable "max_size" {
  description = "The maximum number of EC2 insances in ASG"
  type        = string

}

