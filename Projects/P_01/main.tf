provider "azurerm" {
  features {}
}

# Virtual Network Module
module "my_vnet" {
  source              = "git::https://github.com/yourusername/moduls/virtual-network"
  vnet_name           = "my-vnet"
  address_space       = ["10.0.0.0/16"]
  subnet_count        = 2
  subnet_prefixes     = ["10.0.1.0/24", "10.0.2.0/24"]
  resource_group_name = "myTFResourceGroup"
  location            = "East US"
}
/*
# Network Security Group Module
module "my_nsg" {
  source              = "./network-security-group"
  nsg_name            = "my-nsg"
  resource_group_name = "my-resource-group"
  location            = "East US"
}

# Virtual Machine Module
module "my_vms" {
  source              = "git::https://github.com/yourusername/my-azure-vm-module.git"
  vm_count            = 3
  vm_names            = ["vm1", "vm2", "vm3"]
  resource_group_name = "my-resource-group"
  location            = "East US"
  vm_size             = "Standard_DS2_v2"
  admin_username      = "adminuser"
  admin_password      = "P@ssw0rd123"
  os_disk_image       = "your_os_disk_image_id_or_uri"
  os_type             = "Linux"  # Replace with "Windows" if using a Windows image
  cpu_cores           = 4
  memory_gb           = 8
  virtual_network_id = module.my_vnet.vnet_id
  subnet_ids        = module.my_vnet.subnet_ids
  network_security_group_id = module.my_nsg.nsg_id
}

# Application Gateway Module
module "my_app_gateway" {
  source              = "git::https://github.com/yourusername/my-azure-app-gateway-module.git"
  app_gateway_name   = "my-app-gateway"
  resource_group_name = "my-resource-group"
  location            = "East US"
  frontend_https_port = 443
  ssl_cert_path       = "path/to/your/ssl/certificate.crt"
  backend_pool_name   = "backendPool"
  virtual_network_id = module.my_vnet.vnet_id
  subnet_ids        = module.my_vnet.subnet_ids
  network_security_group_id = module.my_nsg.nsg_id
}

output "vm_ids" {
  value = module.my_vms.vm_ids
}

output "app_gateway_id" {
  value = module.my_app_gateway.app_gateway_id
}
*/
