variable "vpc_subnets" {
type = map(object({
    availability_zone   = string
    cidr_block  = string
}))
  
}