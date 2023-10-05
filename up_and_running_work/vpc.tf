

resource "aws_vpc" "vpc3" {
  cidr_block = "192.168.0.0/16"

  tags = {
    Name = "Terraform up and running work"
  }
}


resource "aws_subnet" "vpc3_subnets" {
  for_each   = var.vpc3_subnets
  vpc_id     = aws_vpc.vpc3.id
  cidr_block = each.value

}

