resource "azurerm_network_interface" "nic" {
  name                = local.nic_name
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = local.vm_name
  resource_group_name = var.rg_name
  location            = var.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDIktg1lswdLg0H2OU/BcAPN8vdCvLKzrVYkXAJgxa+004/UMrtrWaDDV0XgBxAwuJrcVmUmkewh1qMA6KkpMgd34zaHWX9Lh/BJsgbrJhanOWwNpEw3z/Yhhl0v7UBgLHyop6ylUaJR5+4D6uxaK3scFOc2Etdg8oJew5v+VgCyuqXD+0trcD2kszz1oGuG7Rd6wFihf55sEkUGt1xHgNiemFB2O6EL6c26viJLS1qDm9smzaUcM6cEeWVy0v2fxjUj+zjJQHw8a/AepgYKqppv9jH3x1HcIqgLUrne25HQ8XzD4NjVsPp/shXW5/zAScWzOqJL2sMV+E0Xw7hldbz ulrikofstad@Ulriks-MacBook-Pro.local"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}