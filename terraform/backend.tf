terraform {
    backend "azurerm" {
        resource_group_name  = "DevOps"
        storage_account_name = "terraformbackend0205"
        container_name       = "statefile"
        key                  = "terraform.tfstate"
    }
}