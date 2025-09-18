variable "resource_group" {
    type = list(object({
        name     = string
        location = string
        tags     = map(string)
    }))
}

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
    }))
}