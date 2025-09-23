output "private_dns_zone_id" {
    description = "Map of Private DNS Zone IDs keyed by DNS name"
    value       = { for dns in azurerm_private_dns_zone.DevOps_private_dns_zone : dns.name => dns.id }
}