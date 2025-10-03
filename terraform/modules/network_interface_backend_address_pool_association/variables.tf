variable "nic_backend_pool_association" {
    type = list(object({
        network_interface     = string
        ip_configuration_name = string
        backend_address_pool  = string
    }))
}

variable "network_interface" {
    type = map(string)
}

variable "backend_adderss_pool" {
    type = map(string)
}