resource "azurerm_lb_probe" "DevOps_load_balancer_probe" {
    for_each = { for probe in var.load_balancer_probe : probe.name => probe }

    name            = each.value.name
    loadbalancer_id = var.load_balancer[each.value.loadbalancer]
    protocol        = each.value.protocol
    port            = each.value.port
    probe_threshold = try(
        each.value.probe_threshold, null
    )
    request_path    = try(
        each.value.request_path, null
    )
}