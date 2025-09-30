resource "azurerm_storage_container" "DevOps_storage_container" {
    for_each = { for sc in var.storage_container : sc.name => sc }

    storage_account_name  = var.storage_account[each.value.storage_account]
    name                  = each.value.name
    container_access_type = each.value
}