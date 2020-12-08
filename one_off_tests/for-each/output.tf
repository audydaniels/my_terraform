 
#locals { 
#  what  = [
#    for pair in setproduct(var.listenv, var.listapp) : {
#    env   = pair[0].key
#    app   = pair[1].key
#    }
#  ]
#}






locals {
  here = {
   for item in keys(var.environment):
   var.environment[item] => "${var.application[*]}"}
}


#locals {
#  testing = setproduct(["test", "devint", "production"],["app1", "app2", "app3"])
  

locals {
  batman = setproduct(["test", "devint", "production"],["${var.listapp}"])
}

output "myvalue" {
  value = value("${test4}")

}



output "test4" {
   value = setproduct(["test", "devint", "production"],["app1", "app2", "app3"])
}
