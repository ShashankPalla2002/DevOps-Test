output "storage_account_id" {
    description = "Map of Storage Account IDs keyed by Storage Account name"
    value       = { for sa in azurerm_storage_account.DevOps_storage_account : sa.name => sa.id }
}