module "resource_group" {
  source   = "git::https://github.com/tabarak007/Module.git//Resource_group?ref=main"
  for_each = var.rg
  name     = each.value.name
  location = each.value.location
}
module "vnet" {
  source              = "git::https://github.com/tabarak007/Module.git//Vnet?ref=main"
  depends_on          = [module.resource_group]
  for_each            = var.vnet
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space
}
module "super" {

  source = "git::https://github.com/tabarak007/Module.git//subnet?ref=main"

  depends_on           = [module.vnet, module.resource_group]
  for_each             = var.subnet
  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefix       = each.value.address_prefix
}
module "public_ip" {
  
  source = "git::https://github.com/tabarak007/Module.git//Public_IP?ref=main"

  depends_on = [ module.super ]
  public = var.public

}
module "netowrk" {
  source = "git::https://github.com/tabarak007/Module.git//nic?ref=main"
}
  depends_on = [ module.public_ip ]
  nic    = var.nic
}
