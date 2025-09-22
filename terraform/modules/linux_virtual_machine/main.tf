data "azurerm_key_vault" "DevOps_key_vault" {
    name                = var.key_vault.name
    resource_group_name = var.key_vault.resource_group_name
}

data "azurerm_key_vault_secret" "DevOps_linux_vm_password" {
    for_each = { for vm in var.linux_virtual_machine : vm.name => vm }

    name         = each.key
    key_vault_id = data.azurerm_key_vault.DevOps_key_vault.id
}

resource "azurerm_linux_virtual_machine" "DevOps_linux_vm" {
    for_each = { for vm in var.linux_virtual_machine : vm.name => vm }
    
    name                  = each.value.name
    resource_group_name   = each.value.resource_group_name
    location              = each.value.location
    size                  = each.value.size
    network_interface_ids = [ for nic in each.value.network_interface_names : var.network_interface[nic] ]

    os_disk {
        name                 = each.value.os_disk.name
        caching              = each.value.os_disk.caching
        storage_account_type = each.value.os_disk.storage_account_type      
        disk_size_gb         = try(
            each.value.os_disk.disk_size_gb, null
        )
    }

    source_image_reference {
        publisher = each.value.source_image_reference.publisher
        offer     = each.value.source_image_reference.offer
        sku       = each.value.source_image_reference.sku
        version   = each.value.source_image_reference.version
    }

    admin_username                  = each.value.admin_username
    admin_password                  = data.azurerm_key_vault_secret.DevOps_linux_vm_password[each.key].value
    disable_password_authentication = false
}