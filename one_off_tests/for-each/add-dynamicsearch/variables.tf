variable "listenv" {
  type = "list"

    default = [
     "dev", 
     "prod",
    ]
}


variable "listapp" {
  type = "list"

  default = [ 
    "app1", 
    "app2", 
    "app3", 
  ]
}



locals {
  groupname = [
     for pair in setproduct("${var.listenv}", "${var.listapp}") : { 
       combinelist = join("-", [pair[0], pair[1]]) 
       env_key     = pair[0]
       app_key     = pair[1] 
     }
  ]
#  filteroutenv = [
#    for value in setproduct("${var.listenv}", "${var.listapp}") :[
#      for value[0] in value[0] ]
#  ]
 }

output "test" {
  value = "${local.groupname[*].env_key}"  
}


output "dumpenv" {
#  value = "${format("%q", ["${local.groupname.env_key}"])}"
   value = "${local.groupname[0].app_key}"
}



#output "dumpapp" {
#  value = "${local.setformat}"
#}

