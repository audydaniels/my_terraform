
	# Fetches all the AZ from AWS
data "aws_availability_zones" "all" {
  all_availability_zones = true
}

variable "aws_region" {
  description = "Sets the AWS Region"
  default     = "us-east-2"
}

variable "server_port" {
  description = "Sets inbound port for webserver connection"
  default     = 8080
}

#output "spare-value" {
#  description = "Show public IP's on screen after apply"
#  value       = "${aws_instance.example.public_ip}"
#}

variable "my_host" {
  description = "My home IP address" 
  default     = "108.90.7.137/32"
}

variable "elb_port" {
  description	= "Elastic Loadbalancer inbound and outbound port"
  default 	= 80
}

output "elb_dns_name" {
  description	= "Display ELB DNS name after code has run"
  value		= "${aws_elb.example.dns_name}" #This will output the DNS of the ELB
}

variable = "cluster_name" {
  description = "The name to use for all the cluster resources"
}

variable "db_remote_state_bucket" {
  description = "The name of S3 bucket for the database's remote state"
}

variable "db_remote_state_key" {
  description = "The path for the database's remote state in S3"
}

