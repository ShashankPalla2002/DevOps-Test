resource "azurerm_lb_rule" "DevOps_load_balance_rule" {
    for_each = { for rule in var.load_balancer_inbound_rule : rule.name => rule }

    name                           = each.value.name
    loadbalancer_id                = var.load_balancer[each.value.loadbalancer]
    frontend_ip_configuration_name = each.value.frontend_ip_configuration_name
    protocol                       = each.value.protocol
    frontend_port                  = each.value.frontend_port
    backend_port                   = each.value.backend_port
    backend_address_pool_ids       = var.backend_address_pool[each.value.backend_address_pool]
    probe_id                       = var.load_balancer_probe[each.value.probe]
}