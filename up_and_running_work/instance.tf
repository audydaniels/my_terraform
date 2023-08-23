

resource "aws_instance" "test" {
    ami = "ami-0430580de6244e02e"
    instance_type = "t2.micro"
    
    tags = {
        Name = "terraform-example"
    }
}

