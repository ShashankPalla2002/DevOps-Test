output "mysql_flexible_server_id" {
    description = "Map of MySQL IDs keyed by MySQL name"
    value       = { for mysql in azurerm_mysql_flexible_server.DevOps_mysql_server : mysql.name => mysql.id }
}

output "mysql_flexible_server_fqdn" {
    description = "Map of MySQL FQDN keyed by MySQL name"
    value       = { for mysql in azurerm_mysql_flexible_server.DevOps_mysql_server : mysql.name => mysql.fqdn }
}