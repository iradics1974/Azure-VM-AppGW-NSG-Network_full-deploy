provider "azurerm" {
  features {}
}

resource "azurerm_virtual_machine" "vm" {
  count                 = var.vm_count
  name                  = var.vm_names[count.index]
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = []

  storage_image_reference {
    id = var.os_disk_image
  }

  storage_os_disk {
    name              = "${var.vm_names[count.index]}-osdisk"
    caching           = "ReadWrite"
    create_option    = "FromImage"
  }

  os_profile {
    computer_name  = var.vm_names[count.index]
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  hardware_profile {
    vm_size = var.vm_size
  }

  # Define the number of CPU cores and memory for the VM
  os_profile {
    custom_data = var.os_type == "Windows" ? "" : null
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  os_profile_windows_config {
    provision_vm_agent = true
  }

  # Additional configuration as needed
}
