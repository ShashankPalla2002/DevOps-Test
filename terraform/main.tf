module "resource_group" {
    source         = "./modules/resource_group"
    resource_group = var.resource_group
}

module "virtual_network" {
    source          = "./modules/virtual_network"
    virtual_network = var.virtual_network
    resource_group  = module.resource_group.resource_group_name
}

module "subnet" {
    source          = "./modules/subnet"
    subnet          = var.subnet
    resource_group  = module.resource_group.resource_group_name
    virtual_network = module.virtual_network.virtual_network_name
}