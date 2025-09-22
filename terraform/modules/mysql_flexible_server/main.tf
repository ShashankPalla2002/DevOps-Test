data "azurerm_key_vault" "DevOps_key_vault" {
    name                = var.key_vault.name
    resource_group_name = var.key_vault.resource_group_name
}

data "azurerm_key_vault_secret" "DevOps_mysql_server_password" {
    for_each = { for mysql in var.mysql_flexible_server : mysql.name => mysql }

    name         = each.key
    key_vault_id = data.azurerm_key_vault.DevOps_key_vault.id
}

resource "azurerm_mysql_flexible_server" "DevOps_mysql_server" {
    for_each = { for mysql in var.mysql_flexible_server : mysql.name => mysql }

    name                   = each.value.name
    resource_group_name    = each.value.resource_group_name
    location               = each.value.location
    administrator_login    = each.value.administrator_login
    administrator_password = data.azurerm_key_vault_secret.DevOps_mysql_server_password[each.key].value
    delegated_subnet_id    = var.subnet[each.value.delegated_subnet_name]
    private_dns_zone_id    = var.private_dns_zone[each.value.private_dns_zone_name]
    sku_name               = each.value.sku_name
    tags                   = each.value.tags
}