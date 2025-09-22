resource "azurerm_subnet" "DevOps_subnet" {
    for_each = { for subnet in var.subnet: subnet.name => subnet }

    name                 = each.value.name
    resource_group_name  = each.value.resource_group
    virtual_network_name = var.virtual_network[each.value.virtual_network]
    address_prefixes     = each.value.address_prefixes 
}