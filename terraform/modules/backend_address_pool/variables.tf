variable "backend_address_pool" {
    type = list(object({
        name         = string
        loadbalancer = string
    }))
}

variable "load_balancer" {
    type = map(string)
}