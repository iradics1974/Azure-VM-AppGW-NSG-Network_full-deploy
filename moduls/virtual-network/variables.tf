variable "vnet_name" {
  description = "Name of the Virtual Network"
}

variable "address_space" {
  description = "Address space of the Virtual Network"
  type        = list(string)
}

variable "subnet_count" {
  description = "Number of subnets to create"
  type        = number
}

variable "subnet_prefixes" {
  description = "Prefixes for subnets"
  type        = list(string)
}

variable "resource_group_name" {
  description = "Name of the Resource Group"
}

variable "location" {
  description = "Azure region where the resources will be deployed"
}
