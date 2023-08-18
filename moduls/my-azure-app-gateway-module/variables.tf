variable "app_gateway_name" {
  description = "Name of the Azure Application Gateway"
}

variable "resource_group_name" {
  description = "Name of the resource group"
}

variable "location" {
  description = "Azure region where the resources will be deployed"
}

variable "frontend_port" {
  description = "Frontend port for the Application Gateway"
  default     = 80
}

variable "backend_pool_name" {
  description = "Name of the backend pool"
  default     = "backendPool"
}

variable "app_gateway_name" {
  description = "Name of the Azure Application Gateway"
}

variable "resource_group_name" {
  description = "Name of the resource group"
}

variable "location" {
  description = "Azure region where the resources will be deployed"
}

variable "frontend_https_port" {
  description = "Frontend port for HTTPS traffic"
  default     = 443
}

variable "ssl_cert_path" {
  description = "Path to the SSL certificate file"
}

