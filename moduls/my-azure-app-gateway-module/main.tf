provider "azurerm" {
  features {}
}

resource "azurerm_application_gateway" "app_gateway" {
  name                = var.app_gateway_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku {
    name     = "WAF_v2"
    tier     = "WAF_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "appGatewayIpConfig"
    subnet_id = "/subscriptions/xxxx/resourceGroups/${var.resource_group_name}/providers/Microsoft.Network/virtualNetworks/vnet1/subnets/subnet1"
  }

  

  frontend_port {
    name = "https"
    port = var.frontend_https_port
  }

  

  http_listener {
    name                           = "https-listener"
    frontend_ip_configuration_name = "appGatewayIpConfig"
    frontend_port_name             = "https"
    protocol                       = "Https"
    ssl_certificate_name           = "mysslcert"
  }

  backend_address_pool {
    name = "backendPool"
  }

  backend_http_settings {
    name                  = "appGatewayBackendHttpSettings"
    cookie_based_affinity = "Disabled"
    path                  = "/"
    port                  = 80
    protocol              = "Http"
  }

  # SSL Certificate block
  resource "azurerm_application_gateway_ssl_certificate" "ssl_cert" {
    name     = "mysslcert"
    data     = var.ssl_cert_path
    password = ""  # Optional password for the certificate
  }

  # Request Routing Rule for HTTPS
  request_routing_rule {
    name                       = "https-rule"
    rule_type                  = "Basic"
    http_listener_name         = "https-listener"
    backend_address_pool_name  = azurerm_application_gateway.app_gateway.backend_address_pool[0].name
    backend_http_settings_name = "appGatewayBackendHttpSettings"
  }
}
