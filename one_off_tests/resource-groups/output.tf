output "resources" {
  description = "Output resource group info"
  value = "${var.app_name[*]}"
}
