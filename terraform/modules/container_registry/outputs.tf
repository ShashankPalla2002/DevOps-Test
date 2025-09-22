output "container_registry_id" {
    description = "Map of ACR IDs keyed by ACR name"
    value       = { for acr in azurerm_container_registry.DevOps_container_registry : acr.name => acr.id }
}

output "container_registry_login_url" {
    description = "Map of ACR URLs keyed by ACR name"
    value       = { for acr in azurerm_container_registry.DevOps_container_registry : acr.name => acr.login_server }
}