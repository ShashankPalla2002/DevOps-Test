output "resource_group_id" {
    description = "The ID of the resource group"
    value       = module.resource_group.resource_group_id
}

output "virtual_network_id" {
    description = "The ID of the virtual network"
    value       = module.virtual_network.virtual_network_id
}

output "subnet_id" {
    description = "The ID of the subnet"
    value       = module.subnet.subnet_id
}