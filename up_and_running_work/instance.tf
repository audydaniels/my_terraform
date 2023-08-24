

resource "aws_instance" "test" {
    ami = "ami-0430580de6244e02e"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.instance.id]
    
    user_data = <<-EOF
        #!/bin/bash
        echo "Hello, World" > index.html
        nohup busybox httpd -f -p 8080 &
        EOF
    
    tags = {
        Name = "terraform-example"
    }
}

