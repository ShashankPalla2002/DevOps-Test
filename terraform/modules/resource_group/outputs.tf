output "resource_group_id" {
    description = "Map of resource group IDs keyed by Names"
    value       = { for k, v in azurerm_resource_group.DevOps_resource_group : k => v.id }
}

output "resource_group_name" {
    description = "Map of resource group Names keyed by Names for dependent modules"
    value       = { for k, v in azurerm_resource_group.DevOps_resource_group : k => v.name }
}