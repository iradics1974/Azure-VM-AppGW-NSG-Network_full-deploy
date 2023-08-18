variable "vm_count" {
  description = "Number of VM instances to create"
}

variable "vm_names" {
  description = "List of VM names"
  type        = list(string)
}

variable "resource_group_name" {
  description = "Name of the resource group"
}

variable "location" {
  description = "Azure region where the resources will be deployed"
}

variable "vm_size" {
  description = "Size of the VM"
}

variable "admin_username" {
  description = "Admin username for the VM"
}

variable "admin_password" {
  description = "Admin password for the VM"
}

variable "os_disk_image" {
  description = "OS disk image ID or URI"
}

variable "os_type" {
  description = "Operating system type (Windows or Linux)"
}

variable "cpu_cores" {
  description = "Number of CPU cores"
  default     = 2
}

variable "memory_gb" {
  description = "Amount of memory in GB"
  default     = 4
}
