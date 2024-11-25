locals {  
  prefix = "uo_"
  suffix = "_01"

  vnet_name  = "${local.prefix}${var.vnet_base_name}${local.suffix}"
}