 
locals { 
  what  = [
    for pair in setproduct(var.listenv, var.listapp) : {
    env_key 	  = pair[0]
    app_key       = pair[1]		
    name_key      =  join("-", [pair[0], pair[1] ])
    }
  ]
}



output "myvalue" {
  value = (local.what)
}






locals {
  here = {
   for item in keys(var.environment):
   var.environment[item] => "${var.application[*]}"}
}


#locals {
#  testing = setproduct(["test", "devint", "production"],["app1", "app2", "app3"])
  

#locals {
#  batman = setproduct(["test", "devint", "production"],["${var.listapp}"])
#}

output "test4" {
   value = local.here
}
