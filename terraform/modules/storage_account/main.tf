resource "azurerm_storage_account" "DevOps_storage_account" {
    for_each = { for sa in var.storage_account: sa.name => sa }

    name                     = each.value.name
    resource_group_name      = each.value.resource_group_name
    location                 = each.value.location
    account_tier             = each.value.account_tier
    account_replication_type = each.value.account_replication_type
    tags                     = each.value.tags

    network_rules {
        default_action             = each.value.network_rules.default_action
        virtual_network_subnet_ids = try(
            [for sub in each.value.network_rules.virtual_network_subnets : var.subnet[sub]], null
        )
        ip_rules                   = try(
            each.value.network_rules.ip_rules, null
        )
    }
}