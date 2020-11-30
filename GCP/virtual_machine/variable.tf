#variable "path" {
#  description	= "Creds for GCP auth"
#  default 	= "/home/adaniels/projects/gitTerraform/creds"
#}











variable "image" {
  default 	= "ubuntu-os-cloud/ubuntu-1604-lts"
}

variable "machine_type" {
  default 	= "n1-standard-1"
}

 
variable "name_count" {
  default 	= ["server1", "sever2", "server3"]
}

variable "enviornment" {
  default 	= "dev"

}
variable "machine_type_dev" {
  default 	= "n1-standard-4"
}

variable "environment" {
  default 	= "production"
 }

