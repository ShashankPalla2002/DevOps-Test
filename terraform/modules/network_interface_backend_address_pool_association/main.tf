resource "azurerm_network_interface_backend_address_pool_association" "DevOps_nic_backend_address_pool_association" {
    for_each = { for nic in var.nic_backend_pool_association : nic.network_interface => nic }

    network_interface_id    = var.network_interface[each.value.network_interface]
    ip_configuration_name   = each.value.ip_configuration_name
    backend_address_pool_id = var.backend_adderss_pool[each.value.backend_address_pool]
}