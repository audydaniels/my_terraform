resource "aws_db_instance" "mysql" {
  identifier_prefix        = "${var.env}-terraform-up-running"
  engine                   = "mysql"
  allocated_storage        = "10"
  instance_class           = "db.t3.micro"
  db_name                  = "${var.env}_mysqldb"
  db_subnet_group_name     = aws_db_subnet_group.mysql_subnet_group.id
  username                 = "admin"
  password                 = var.db_password
  skip_final_snapshot      = true
  delete_automated_backups = true
  deletion_protection      = false

}



#use flatten to turn a touple into a list Pull subnets out of terraform state file in S3
resource "aws_db_subnet_group" "mysql_subnet_group" {
  name       = "${var.env}_db_subnet_group"
  subnet_ids = flatten(var.subnets_ids)
  
  
}

