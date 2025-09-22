output "subnet_id" {
    description = "Map of Subnet IDs keyed by subnet Name"
    value       = { for subnet in azurermazurerm_subnet.DevOps_subnet : subnet.name => subnet.id }
}