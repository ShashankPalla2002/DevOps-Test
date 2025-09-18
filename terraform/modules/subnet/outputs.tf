output "subnet_id" {
    description = "Map of Subnet IDs keyed by subnet Name"
    value       = { for k, v in azurermazurerm_subnet.DevOps_subnet : k => v.id }
}