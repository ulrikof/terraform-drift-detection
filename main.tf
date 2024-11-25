resource "azurerm_resource_group" "rg" {
  name     = "uo-drift-detection-rg"
  location = "West Europe"
}

module "vnet" {
  source         = "./modules/vnet"
  rg_name        = azurerm_resource_group.rg.name
  location       = azurerm_resource_group.rg.location
  vnet_base_name = "test_vnet"
}

module "vm" {
  source        = "./modules/vm"
  rg_name       = azurerm_resource_group.rg.name
  location      = azurerm_resource_group.rg.location
  vm_base_name  = "test_vm"
  nic_base_name = "test_nic"
  subnet_id     = module.vnet.subnet_id
}

#test