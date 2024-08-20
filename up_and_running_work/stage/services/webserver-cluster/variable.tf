variable "server_port" {
  description = "inbound web server port"
  type        = string
}



variable "vpc3_subnets" {
type = map(object({
    availability_zone   = string
    cidr_block  = string
}))
  
}


