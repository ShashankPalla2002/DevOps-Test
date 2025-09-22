virtual_network = [
    {
        name           = "DevOps-VNet"
        location       = "southindia"
        resource_group = "DevOps"
        address_space  = ["10.0.0.0/16"]

        tags           = {
            environment = "dev"
            project     = "Internal"
        }
    }
]

subnet = [
    {
        name             = "public-subnet"
        resource_group   = "DevOps"
        virtual_network  = "DevOps-VNet"
        address_prefixes = ["10.0.1.0/24"]
    },
    {
        name             = "private-subnet"
        resource_group   = "DevOps"
        virtual_network  = "DevOps-VNet"
        address_prefixes = ["10.0.2.0/24"]
    }
]

network_security_group = [
    {
        name                = "public-subnet-nsg"
        location            = "southindia"
        resource_group_name = "DevOps"
        subnet_name         = "DevOps-VNet"
        tags                = {
            environment = "dev"
            project     = "Internal"
        }
        rules               = [
            {
                name                       = "HTTP"
                priority                   = 100
                direction                  = "Inbound"
                access                     = "Allow"
                protocol                   = "Tcp"
                source_port_range          = "*"
                destination_port_range     = "80"
                source_address_prefix      = "*"
                destination_address_prefix = "10.0.1.0/24"
            },
            {
                name                       = "HTTPS"
                priority                   = 110
                direction                  = "Inbound"
                access                     = "Allow"
                protocol                   = "Tcp"
                source_port_range          = "*"
                destination_port_range     = "443"
                source_address_prefix      = "*"
                destination_address_prefix = "10.0.1.0/24"
            },
            {
                name                       = "SSH"
                priority                   = 120
                direction                  = "Inbound"
                access                     = "Allow"
                protocol                   = "Tcp"
                source_port_range          = "*"
                destination_port_range     = "22"
                source_address_prefix      = "*"
                destination_address_prefix = "10.0.1.0/24"
            }
        ]
    }
]

public_ip = [
    {
        name                = "webserver-public-ip"
        location            = "southindia"
        resource_group_name = "DevOps"
        allocation_method   = "Static"
        sku                 = "Standard"
        tags                = {
            environment = "dev"
            project     = "Internal"
        }
    }
]

network_interface = [
    {
        name                = "webserver-nic"
        location            = "southindia"
        resource_group_name = "DevOps"

        ip_configuration    = {
            name                          = "external-traffic"
            subnet_name                   = "public-subnet"
            private_ip_address_allocation = "Dynamic"
            public_ip_address_name        = "webserver-public-ip"
        }

        tags                = {
            environment = "dev"
            project     = "Robot-Shop"
        }
    } 
]

linux_virtual_machine = [
    {
        name                    = "Angular-Webserver"
        location                = "southindia"
        resource_group_name     = "DevOps"
        size                    = "Standard_D2s_v3"
        network_interface_names = ["webserver-nic"]
        os_disk                 = {
            name                 = "angular-webserver-osdisk"
            caching              = "ReadWrite"
            storage_account_type = "ReadWrite"
            disk_size_gb         = 30
        }

        source_image_reference  = {
            publisher = "Canonical"
            offer     = "ubuntu-24_04-lts"
            sku       = "server"
            version   = "latest"
        }
        
        admin_username          = "webserver"
    }
]

key_vault = {
    name = "DevOpsKeyVault0205"
    resource_group_name = "DevOps"
    secret_name = ["Angular-Webserver", "DevOps-MySQL"]
}

private_dns_zone = [
    {
        name                = "devops.mysql.database.azure.com"
        resource_group_name = "DevOps"
        virtual_network     = "DevOps-VNet"
        
        tags                = {
            environment = "dev"
            project     = "Robot-Shop"
        }
    }
]

mysql_flexible_server = [
    {
        name                  = "DevOps-MySQL"
        resource_group_name   = "DevOps"
        location              = "southindia"
        administrator_login   = "mysql"
        delegated_subnet_name = "private-subnet"
        private_dns_zone_name = "devops.mysql.database.azure.com"
        sku_name              = "dev/test"
        tags                  = {
            environment = "dev"
            project     = "Robot-Shop"
        }
    }
]

kubernetes_cluster = [
    {
        name                       = "DevOps-AKS"
        location                   = "southindia"
        resource_group_name        = "DevOps"

        identity                   = {
            type = "SystemAssigned"
        }

        default_node_pool          = {
            name        = "systemnode"
            node_count  = 1
            vm_size     = "Standard_B2ms"
            subnet_name = "private-subnet"
        }

        dns_prefix_private_cluster = "devops-aks"
        private_cluster_enabled    = true

        network_profile            = {
            network_plugin    = "azure"
            network_policy    = "azure"
            load_balancer_sku = "standard"
            outbound_type     = "loadBalancer"
            service_cidr      = "10.1.0.0/24"
            dns_service_ip    = "10.1.0.10"
        }
    }
]

container_registry = [
    {
        name                = "DevOpsACR0205"
        resource_group_name = "DevOps"
        location            = "southindia"
        sku                 = "Basic"

        tags                = {
            environment = "dev"
            project     = "Robot-Shop"
        }
    }
]