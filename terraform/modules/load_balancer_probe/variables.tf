variable "load_balancer_probe" {
    type = list(object({
        name            = string
        loadbalancer    = string
        protocol        = string
        port            = number
        probe_threshold = optional(number)
        request_path    = optional(string) 
    }))
}

variable "load_balancer" {
    type = map(string)
}