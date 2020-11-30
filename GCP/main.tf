



resource "google_compute_instance" "host" { 
  count 	= "${var.machine_count}"
  name 		= "list-${count.index+1}"
  machine_type 	= "${var.enviornment == "production" ? var.machine_type : var.machine_type_dev }" 
  zone 		= "us-central1-a"
  can_ip_forward = "false"
  description   = "This is our Virtual Machine" 

  tags = ["allow-http", "allow-https"] #FIREWALL

  boot_disk {
    initialize_params {
      image = var.image
      size  = "20"
    }
  
  }
 
  labels = {
    name = "list-${count.index+1}"
    machine_type = "${var.enviornment == "production" ? var.machine_type : var.machine_type_dev}"
  }

  network_interface {
    network = "default" 
  }
  
 metadata = {
   size = "20"
   foo = "bar"
 }

 metadata_startup_script = "echo hi" 


  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro" ]
  }

#  depends_on= ["google_compute_instance.second"]

}

resource "google_compute_disk" "default" {
  name = "tesk-desk"
  type = "pd-ssd"
  zone = "us-central1-a"
  size = "10"

}

resource "google_compute_attached_disk" "default" {
  disk = "${google_compute_disk.default.self_link}"
  instance = "${google_compute_instance.host[0].self_link}"
}
