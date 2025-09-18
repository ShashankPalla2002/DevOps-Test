resource "azurerm_resource_group" "DevOps_resource_group" {
    for_each = { for rg in var.resource_group : rg.name => rg }

    name     = each.value.name
    location = each.value.location
    tags     = each.value.tags
}