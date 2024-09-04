variable "vpc_subnets" {
type = map(object({
    availability_zone   = string
    cidr_block  = string
}))
  
}


variable "server_port" {
    description = "inbound port to access ALB"
    type = string
    
  
}

variable "my_public_ip" {
    description = "My ip from my home"
    type = string  
}

variable "alb_port" {
    description = "port from alb to serving hosts"
    type = string

  
}