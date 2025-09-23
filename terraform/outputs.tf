output "virtual_network_id" {
    description = "The ID of the virtual network"
    value       = module.virtual_network.virtual_network_id
}

output "subnet_id" {
    description = "The ID of the subnet"
    value       = module.subnet.subnet_id
}

output "public_ip_id" {
    description = "The ID of the public IP"
    value       = module.public_ip.public_ip_id
}

output "network_interface_id" {
    description = "The ID of the Network Interface"
    value       = module.network_interface.network_interface_id
}

output "linux_virtual_machine_id" {
    description = "The ID of the Linux Virtual Machine"
    value       = module.linux_virtual_machine.linux_vm_id
}

output "network_security_group_id" {
    description = "The ID of the Network Security Group"
    value       = module.network_security_group.network_security_group_id
}

output "private_dns_zone_id" {
    description = "The ID of the Private DNS Zone"
    value       = module.private_dns_zone.private_dns_zone_id
}

output "mysql_flexible_server_id" {
    description = "The ID of the MySQL Server"
    value       = module.mysql_flexible_server.mysql_flexible_server_id
}

output "mysql_flexible_server_fqdn" {
    description = "The FQDN of the MySQL Server"
    value       = module.mysql_flexible_server.mysql_flexible_server_fqdn
}

output "kubernetes_cluster_id" {
    description = "The ID of the Kubernetes Cluster"
    value       = module.kubernetes_cluster.kubernetes_cluster_id
}

output "container_registry_id" {
    description = "The ID of the ACR"
    value       = module.container_registry.container_registry_id
}

output "container_registry_login_url" {
    description = "The login URL of the ACR"
    value       = module.container_registry.container_registry_login_url
}