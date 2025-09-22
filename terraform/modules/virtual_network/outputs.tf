output "virtual_network_name" {
  description = "Map of VNet Names keyed by Vnet Name for dependent modules"
  value       = { for vnet in azurerm_virtual_network.DevOps_VNet : vnet.name => vnet.name }
}

output "virtual_network_id" {
  description = "Map of VNet IDs keyed by Vnet Names"
  value       = { for vnet in azurerm_virtual_network.DevOps_VNet : vnet.name => vnet.id }
}