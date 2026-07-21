module "resource_group" {
  source   = "git::https://github.com/tabarak007/Module.git//Resource_group?ref=main"
 rg = var.rg
}
module "vnet" {
  source              = "git::https://github.com/tabarak007/Module.git//virtual_network?ref=main"
  depends_on          = [module.resource_group]
  vnet               = var.vnet
}
module "super" {

  source = "git::https://github.com/tabarak007/Module.git//subnet?ref=main"

  depends_on           = [module.vnet, module.resource_group]
  for_each             = var.subnet
 subnet               = var.subnet
}
module "public_ip" {
  
  source = "git::https://github.com/tabarak007/Module.git//Public_IP?ref=main"

  depends_on = [ module.super ]
  public = var.public

}
module "netowrk" {
  source = "git::https://github.com/tabarak007/Module.git//nic?ref=main"

  depends_on = [ module.public_ip ]
  nic    = var.nic
}
module "computer" {
  source     = "git::https://github.com/tabarak007/Module.git//virtual_machine?ref=main"
  depends_on = [module.netowrk]
  vms        = var.vms
}
module "windows_vm" {
  source     = "git::https://github.com/tabarak007/Module.git//window_virtual_machine?ref=main"
  depends_on = [module.netowrk]
  khidki     = var.khidki
}
