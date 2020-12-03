module "instance" {
  source 		= "../../virtual_machine"
  machine_type_dev	= "n1-standard-2" 
}


module "instance_two" {
  source 		= "../../virtual_machine"
  enviornment   	= "production"
  machine_type_dev 	= "n1-standard-1"
}


module "bucket" {
  source 		= "../../bucket"
  bucket_name		= "module-test-ajd"
}
