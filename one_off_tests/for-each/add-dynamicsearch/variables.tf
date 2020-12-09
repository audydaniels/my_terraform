variable "listenv" {
  type = "list"

    default = [
     "env1", 
     "env2",
     "env3",
     "env4"
    ]
}


variable "listapp" {
  type = "list"

  default = [ 
    "app1", 
    "app2", 
    "app3", 
    "app4" 
  ]
}



locals {
  setformat = [
     for pair in setproduct("${var.listenv}", "${var.listapp}") : { 
       env_key = pair[0]
       app_key = pair[1]
       combinelist = join("-", [pair[0], pair[1]]) 
     }
  ]
}







output "dumpenv" {
  value = "${local.setformat[0]}"}

#output "dumpapp" {
#  value = "${var.listapp}"
#}






