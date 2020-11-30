output "machine_type" {
  value = "${google_compute_instance.host.machine_type}"
}

output "name" {
  value = "${google_compute_instance.host.name}"
}

output "zone" {
  value = "${google_compute_instance.host.zone}"
}

