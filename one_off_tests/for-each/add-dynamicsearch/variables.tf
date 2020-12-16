variable "listenv" {
  type = "list"

    default = [
     "devdint", 
     "prod",
     "test",
    ]
}

variable "listapp" {
  type = "list"

  default = [
    "adt-cell-bounce", 
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
}

