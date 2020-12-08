variable "manual_map" {
  
  default = [ 
    {
     env = "test"
     app = "app1"
    },
    {
     env = "prod"
     app = "app2"
    }
  ] 
}





variable "application" {
  type = "map"
  default = {
    "mongo"    = "MongoDB"
    "ump"      = "ump-application"
    "arb"      = "arb-application"
    "apptest"  = "test3"
  }
}

variable "environment" {
  type = "map"
   default =  {
    "test"       	= "test"
    "devinit"   	= "devint"
    "prod"      	= "production"
 }
}

variable "listapp" {
  type = "list"
  default = ["app1","app2","app3","app4","app5","app6"]
}

variable "listenv" {
  type = "list"
  default = ["env1","env2","env3","env4"]
}


variable "var_a" {
    type = "map"
    default = {
        "a" = "one"
        "b" = "two"
    }
}

variable "var_b" {
    type = "map"
    default = {
        "a" = "one"
        "b" = "two"
    }
}

