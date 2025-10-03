output "load_balancer_probe_id" {
    description = "Map of LB probe IDs keyed by LB probe name"
    value = { for probe in azurerm_lb_probe.DevOps_load_balancer_probe : probe.name => probe.id }
}