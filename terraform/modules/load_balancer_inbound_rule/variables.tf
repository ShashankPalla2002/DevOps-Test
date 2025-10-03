variable "load_balancer_inbound_rule" {
    type = list(object({
        name                           = string
        loadbalancer                   = string
        frontend_ip_configuration_name = string
        protocol                       = string
        frontend_port                  = number
        backend_port                   = number
        backend_address_pool           = list(string)
        probe                          = string
    }))
}

variable "load_balancer" {
    type = map(string)
}

variable "backend_address_pool" {
    type = map(string)
}

variable "load_balancer_probe" {
    type = map(string)
}