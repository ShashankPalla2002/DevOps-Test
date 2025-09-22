output "network_security_group_id" {
    description = "Map of Network Security Group IDs keyed by NSG name"
    value = { for nsg in azurerm_network_security_group.Devops_network_security_group : nsg.name => nsg.id }
}