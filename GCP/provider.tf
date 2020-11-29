
variable "path" {
   default  = "/home/adaniels/projects/gitTerraform/creds"
}








provider "google" {
  project = "marine-foundry-295612"
  region  = "us-central1"
  credentials = file("${var.path}/key.json")
}
