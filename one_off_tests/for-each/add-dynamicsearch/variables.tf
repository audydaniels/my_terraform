variable "listenv" {
  type = "list"

    default = [
     "env1", 
     "env2",
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
     }
  ]
  filteroutenv = [
    for value in setproduct("${var.listenv}", "${var.listapp}") : {
      Values = jsonencode(value[0]) 

    }
  ]
 }

#variable "test" {
#  default = local.filteroutenv  
#}



output "dumpenv" {
#  value = "${format("%q", ["${local.groupname.env_key}"])}"
   value = tostring(["${local.filteroutenv}"])
}



#output "dumpapp" {
#  value = "${local.setformat}"
#}






