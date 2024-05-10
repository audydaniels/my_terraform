server_port = 8080

# vpc3_subnets = {
#   subnet1 = {
#     ip_address = "10.0.0.0/24"
#     availability_zone = "us-east-2a"
#   }
#   subnet2 ={
#     ip_address = "10.0.1.0/24"
#     c = "us-east-2b"
    
#   }
#   subnet3 = {
#     ip_address = "10.0.2.0/24"
#     availability_zone = "us-east-2c"
#     }
# }




vpc3_subnets = {

    UARW_subnet1 = {
        availability_zone   = "us-east-2a"
        cidr_block  = "10.0.0.0/24"
    }
    UARW_subnet2 = {
        availability_zone   = "us-east-2b"
        "cidr_block"  = "10.0.1.0/24"
    }
    
    UARW_subnet3 = {
        availability_zone   = "us-east-2c"
        cidr_block = "10.0.2.0/24"
    } 
    
}


