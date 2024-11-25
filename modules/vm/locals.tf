locals {
  prefix   = "uo_"
  suffix   = "_01"
  vm_name  = local.prefix + var.vm_base_name + local.suffix
  nic_name = local.prefix + var.nic_base_name + local.suffix
}