



resource "google_compute_instance" "host" { 
  count 	= "1"
  name 		= "list-${count.index+1}"
  machine_type 	= "${var.enviornment == "production" ? var.machine_type : var.machine_type_dev }" 
  zone 		= "us-central1-a"



  boot_disk {
    initialize_params {
      image = var.image
    }
  
  }
  
  network_interface {
    network = "default" 
  
  }
  
  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro" ]
  }

#  depends_on= ["google_compute_instance.second"]

}




