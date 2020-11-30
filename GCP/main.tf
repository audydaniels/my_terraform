
resource "google_compute_instance" "host" { 
  name = "test-instance"
  machine_type = var.machine_type
  zone = "us-central1-a"

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
}

