output "network_interface_id" {
    description = "Map of Network Interface IDs keyed by NIC name"
    value       = { for nic in azurerm_network_interface.DevOps_network_interface : nic.name => nic.id }
}