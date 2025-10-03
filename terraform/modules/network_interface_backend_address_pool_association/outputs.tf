output "nic_backend_pool_association_id" {
    description = "Map of NIC backend pool IDs keyed by NIC name"
    value = { for nic in azurerm_network_interface_backend_address_pool_association.DevOps_nic_backend_address_pool_association : nic.network_interface => nic.id }
}