locals {
  prefix = "uo-"
  suffix = "-01"

  vnet_name = "${local.prefix}${var.vnet_base_name}${local.suffix}"
}