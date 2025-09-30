variable "linux_virtual_machine" {
    type = list(object({
        name                    = string
        location                = string
        resource_group_name     = string
        size                    = string
        network_interface_names = list(string)

        os_disk                 = object({
            name                 = string
            caching              = string
            storage_account_type = string
            os_disk_size_gb      = optional(number)
        })

        source_image_reference  = object({
            publisher = string
            offer     = string
            sku       = string
            version   = string
        })

        identity                = optional(object({
            type         = string
            identity_ids = optional(list(string))
        }))

        admin_username          = string
    }))
}

variable "network_interface" {
    type = map(string)
}

variable "key_vault" {
   type = object({
        name                = string
        resource_group_name = string
        secret_name         = list(string)
   })
}