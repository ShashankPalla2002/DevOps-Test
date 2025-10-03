output "load_balancer_id" {
    description = "Map of Load Balancer IDs keyed by Load Balancer name"
    value       = { for lb in azurerm_lb.DevOps_load_balancer : lb.name => lb.id }
}