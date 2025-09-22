variable "subnet" {
    type = list(object({
        name              = string
        resource_group    = string
        virtual_network   = string
        address_prefixes  = list(string)
    }))
}

variable "virtual_network" {
    type = map(string) 
}