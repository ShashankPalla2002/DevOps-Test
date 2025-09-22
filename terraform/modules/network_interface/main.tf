resource "azurerm_network_interface" "DevOps_network_interface" {
    for_each = { for nic in var.network_interface : nic.name => nic }

    name                = each.value.name
    location            = each.value.location
    resource_group_name = each.value.resource_group_name

    ip_configuration {
        name                          = each.value.ip_configuration.name
        subnet_id                     = var.subnet[each.value.ip_configuration.subnet_name]
        private_ip_address_allocation = each.value.ip_configuration.private_ip_address_allocation
        public_ip_address_id          = try(
            var.public_ip[each.value.ip_configuration.public_ip_address_name], null
        )
    }
}