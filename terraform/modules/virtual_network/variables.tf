variable "virtual_network" {
    type = list(object({
        name           = string
        location       = string
        resource_group = string
        address_space  = list(string)
        tags           = map(string)
    }))
}

variable "resource_group" {
    type = map(string)
}