module "virtual_network" {
    source          = "./modules/virtual_network"
    virtual_network = var.virtual_network
}

module "subnet" {
    source          = "./modules/subnet"
    subnet          = var.subnet
    virtual_network = module.virtual_network.virtual_network_name
}

module "public_ip" {
    source    = "./modules/public_ip"
    public_ip = var.public_ip
}

module "network_interface" {
    source            = "./modules/network_interface"
    network_interface = var.network_interface
    subnet            = module.subnet.subnet_id
    public_ip         = module.public_ip.public_ip_id
}

module "linux_virtual_machine" {
    source                = "./modules/linux_virtual_machine"
    linux_virtual_machine = var.linux_virtual_machine
    network_interface     = module.network_interface.network_interface_id
    key_vault             = var.key_vault
}

module "network_security_group" {
    source                 = "./modules/network_security_group"
    network_security_group = var.network_security_group
    subnet                 = module.subnet.subnet_id
}

module "private_dns_zone" {
    source           = "./modules/private_dns_zone"
    private_dns_zone = var.private_dns_zone
    virtual_network  = module.virtual_network.virtual_network_id
}

module "mysql_flexible_server" {
    source                = "./modules/mysql_flexible_server"
    mysql_flexible_server = var.mysql_flexible_server
    subnet                = module.subnet.subnet_id
    private_dns_zone      = module.private_dns_zone.private_dns_zone_id
    key_vault             = var.key_vault
    depends_on            = [module.private_dns_zone]
}

module "kubernetes_cluster" {
    source             = "./modules/kubernetes_cluster"
    kubernetes_cluster = var.kubernetes_cluster
    subnet             = module.subnet.subnet_id
}

module "container_registry" {
    source             = "./modules/container_registry"
    container_registry = var.container_registry
}

module "storage_account" {
    source = "./modules/storage_account"
    storage_account = var.storage_account
    subnet = module.subnet.subnet_id
}

module "storage_container" {
    source = "./modules/storage_container"
    storage_container = var.storage_container
    storage_account = module.storage_account.storage_account_name
}

module "load_balancer" {
    source        = "./modules/load_balancer"
    load_balancer = var.load_balancer
    public_ip     = module.public_ip.public_ip_id
}

module "backend_address_pool" {
    source               = "./modules/backend_address_pool"
    backend_address_pool = var.backend_address_pool
    load_balancer        = module.load_balancer.load_balancer_id
}

module "nic_backend_address_pool_association" {
    source                       = "./modules/network_interface_backend_address_pool_association"
    nic_backend_pool_association = var.nic_backend_pool_association
    network_interface            = module.network_interface.network_interface_id
    backend_adderss_pool         = module.backend_address_pool.backend_address_pool_id
}

module "load_balancer_probe" {
    source              = "./modules/load_balancer_probe"
    load_balancer_probe = var.load_balancer_probe
    load_balancer       = module.load_balancer.load_balancer_id
}

module "load_balancer_inbound_rule" {
    source                     = "./modules/load_balancer_inbound_rule"
    load_balancer_inbound_rule = var.load_balancer_inbound_rule
    load_balancer              = module.load_balancer.load_balancer_id
    load_balancer_probe        = module.load_balancer_probe.load_balancer_probe_id
    backend_address_pool       = module.backend_address_pool.backend_address_pool_id
}