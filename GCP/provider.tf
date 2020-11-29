#varible "path" {
#   default  = "/home/adaniels/projects/gitTerraform/creds"
#}

provider "google" {
  project = "My First Project"
  region  = "us-west1-a"
  credentials = "${file("${var.path}/secrets.json")}"
}
