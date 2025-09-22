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

variable "subnet" {
    type = map(string)
}

variable "public_ip" {
    type = map(string)
}