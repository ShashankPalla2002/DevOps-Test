output "linux_vm_id" {
    description = "Map of linux VM IDs keyed by VM name"
    value       = { for vm in azurerm_linux_virtual_machine.DevOps_linux_vm : vm.name => vm.id }
}