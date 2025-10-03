output "load_balancer_inbound_rule_id" {
    description = "Map of LB inbound rule IDs keyed by LB rule name"
    value       = { for rule in azurerm_lb_rule.DevOps_load_balance_rule : rule.name => rule.id }
}