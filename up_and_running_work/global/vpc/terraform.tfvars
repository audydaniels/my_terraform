
vpc_subnets = {

    subnet1 = {
      cidr_block = "10.2.0.0/24"     
      availability_zone = "us-east-2a"
    }
    
    subnet2 = {
      cidr_block = "10.2.1.0/24"
      availability_zone = "us-east-2b"
    }
    
    
    subnet3 = {
      cidr_block = "10.2.2.0/24"
      availability_zone = "us-east-2c"
    }
}


server_port = "8080"
alb_port = "80"

my_public_ip = "108.90.7.137/32"