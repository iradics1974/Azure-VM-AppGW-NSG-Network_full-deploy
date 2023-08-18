output "app_gateway_id" {
  value = azurerm_application_gateway.app_gateway.id
}

output "https_listener_name" {
  value = "https-listener"
}
