variable "virtual_network" {
    type = list(object({
        name           = string
        location       = string
        resource_group = string
        address_space  = list(string)
        tags           = map(string)
    }))
}

variable "subnet" {
    type = list(object({
        name              = string
        resource_group    = string
        virtual_network   = string
        address_prefixes  = list(string)

        delegation        = optional(object({
            name               = string
            service_delegation = object({
                name    = string
                actions = list(string)
            })
        }))
    }))
}

variable "public_ip" {
    type = list(object({
        name                = string
        location            = string
        resource_group_name = string
        allocation_method   = string
        sku                 = string
        tags                = map(string)
    }))
}

variable "network_interface" {
    type = list(object({
        name                = string   
        location            = string
        resource_group_name = string
        
        ip_configuration    = object({
            name                          = string
            subnet_name                   = string
            private_ip_address_allocation = string
            public_ip_address_name        = optional(string)        
        })
        tags                = map(string)
    }))
}

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

        admin_username          = string
    }))
}

variable "key_vault" {
   type = object({
        name                = string
        resource_group_name = string
        secret_name         = list(string)
   })
}

variable "network_security_group" {
    type = list(object({
        name                = string
        location            = string
        resource_group_name = string
        tags                = map(string)
        subnet_name         = string
        rules               = list(object({
            name                       = string
            priority                   = number
            direction                  = string
            access                     = string
            protocol                   = string
            source_port_range          = string
            destination_port_range     = string
            source_address_prefix      = string
            destination_address_prefix = string
        }))
    }))
}

variable "private_dns_zone" {
    type = list(object({
        name                = string
        resource_group_name = string
        virtual_network     = string
        tags                = map(string)
    }))
}

variable "mysql_flexible_server" {
    type = list(object({
        name                  = string
        resource_group_name   = string
        location              = string
        administrator_login   = string
        delegated_subnet_name = string
        private_dns_zone_name = string
        sku_name              = string
        tags                  = map(string)
    }))
}

variable "kubernetes_cluster" {
    type = list(object({
        name                       = string
        location                   = string
        resource_group_name        = string
        
        identity                   = object({
            type = string
        })

        default_node_pool          = object({
            name        = string
            node_count  = number
            vm_size     = string
            subnet_name = string
        })

        dns_prefix                 = optional(string)
        dns_prefix_private_cluster = optional(string)
        private_cluster_enabled    = bool

        network_profile            = object({
            network_plugin    = string
            network_policy    = string
            load_balancer_sku = string
            outbound_type     = string
            service_cidr      = string
            dns_service_ip    = string
        })
    }))
}

variable "container_registry" {
    type = list(object({
        name                = string
        resource_group_name = string
        location            = string
        sku                 = string
        tags                = map(string)
    }))
}