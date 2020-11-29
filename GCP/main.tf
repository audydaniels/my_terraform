resource "google_compute_instance" "host" { 
  name = "test-instance"
  machine_type = "n1-stndard-1"
  zone = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1604-lts"
    }
  
  }
  
  network_interface {
    network = "default" 
  
  }
  
  service_account {
    scopes = ["userinfo-email", "computer-ro", "storage-ro" ]
  
  }
}

