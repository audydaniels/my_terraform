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
     }
  ]
  filteroutenv = [
    for value in setproduct("${var.listenv}", "${var.listapp}") : {
      env_key = concat([value[0]])
    }
  ]
 }

variable "cat" {
  default = "cat"  
}


#output "dumpenv" {
#  value = "${local.filterout}"
#}

#output "dumpapp" {
#  value = "${local.setformat}"
#}






