 
output "test-list" {
  value = [ for name in var.listapp : upper(name) ]

}

output "test-map" {
   value = [ 
     for env, app in var.application : "${env} is the ${app}" ]

}

output "combo" {
  value = {
      for item in keys(var.environment):
      var.environment[item] => "${var.application[*]}"
  }
}

#output "tomaptest"{ 
#  value = {
#      for item local.here : "${item}.${.}
#      var.environment[item] => "${var.application[*]}"}
#}


locals {
  here = {
   for item in keys(var.environment):
   var.environment[item] => "${var.application[*]}"}

}


output "lcltest" {
   value = { list = ["${local.here.production.*}"] }

}






# Handles matches where B does not have the key listed in A
output "my_vars_mismatch" {
  value = {
      for item in keys(var.var_a):
      var.var_a[item] => lookup(var.var_b, item, null)
  }
}



# Assumes that the lists are aligned
output "my_vars_aligned" {
  value = {
      for item in keys(var.var_a):
      var.var_a[item] => var.var_b[item]
  }
}
