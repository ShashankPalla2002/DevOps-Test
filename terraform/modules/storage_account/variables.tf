variable "storage_account" {
    type = list(object({
        name                     = string
        resource_group_name      = string
        location                 = string
        account_tier             = string
        account_replication_type = string
        tags                     = map(string)

        network_rules = object({
            default_action          = string
            virtual_network_subnets = optional(list(string))
            ip_rules                = optional(list(string))
        })
    }))
}

variable "subnet" {
    type = map(string)
}