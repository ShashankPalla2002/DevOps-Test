resource "azurerm_virtual_network" "DevOps_VNet" {
    for_each = { for vnet in var.virtual_network : vnet.name => vnet }

    name                = each.value.name
    address_space       = each.value.address_space
    location            = each.value.location
    resource_group_name = var.resource_group[each.value.resource_group]
    tags                = each.value.tags
}