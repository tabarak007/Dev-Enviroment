module "resource_group" {
  source   = "../module/resource_group"
  for_each = var.rg
  name     = each.value.name
  location = each.value.location
}
module "vnet" {
  source              = "../module/virtual_network"
  depends_on          = [module.resource_group]
  for_each            = var.vnet
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space
}
module "super" {
  source               = "../module/subnet"
  depends_on           = [module.vnet, module.resource_group]
  for_each             = var.subnet
  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefix       = each.value.address_prefix
}
module "public_ip" {
  source = "../module/public_ip"
  depends_on = [ module.super ]
  public = var.public

}
module "netowrk" {
  source = "../module/nic"
  depends_on = [ module.public_ip ]
  nic    = var.nic
}