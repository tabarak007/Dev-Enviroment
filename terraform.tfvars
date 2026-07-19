rg = {
  rg1 = {
    name     = "popu"
    location = "central india"
  }
}
vnet = {
  vnet1 = {
    name                = "D-link"
    location            = "central india"
    resource_group_name = "popu"
    address_space       = ["10.0.0.0/16"]
  }
}
subnet = {
  subnet1 = {
    name                 = "access"
    resource_group_name  = "popu"
    virtual_network_name = "D-link"
    address_prefix       = ["10.0.1.0/24"]
  }
  subnet2 = {
    name                 = "access1"
    resource_group_name  = "popu"
    virtual_network_name = "D-link"
    address_prefix       = ["10.0.2.0/24"]
  }
}

public = {
  public1 = {
    name                = "publicip"
    resource_group_name = "popu"
    location            = "central india"
    allocation_method   = "Static"
  }
  public2 = {
    name                = "publicip1"
    resource_group_name = "popu"
    location            = "central india"
    allocation_method   = "Static"
  }
}

nic = {
  nic1 = {
    name                = "connect"
    location            = "central india"
    resource_group_name = "popu"
    subnet_name         = "access"
    virtual_network_name = "D-link"
    public_ip_name       = "publicip"
  }
  nic2 = {
    name                = "connect2"
    location            = "central india"
    resource_group_name = "popu"
    subnet_name         = "access1"
    virtual_network_name = "D-link"
    public_ip_name       = "publicip1"
  }
}
vms = {
  vm1 = {
    name                            = "forntendvm"
    location                        = "central india"
    resource_group_name             = "popu"
    vm_size                         = "Standard_D2s_v3"
    publisher                       = "Canonical"
    offer                           = "ubuntu-24_04-lts"
    sku                             = "server"
    version                         = "latest"
    disk_name                       = "mydisk"
    caching                         = "ReadWrite"
    create_option                   = "FromImage"
    managed_disk_type               = "Standard_LRS"
    nic_name                        = "connect"
    computer_name                   = "unms"
    admin_username                  = "pgcil"
    admin_password                  = "Pgcil123@123"
    disable_password_authentication = false
  }
}

khidki = {
  vm2 = {
    name                = "windowsvm"
    location            = "central india"
    resource_group_name = "popu"
    vm_size             = "Standard_D2s_v3"
    publisher           = "MicrosoftWindowsServer"
    offer               = "WindowsServer"
    sku                 = "2019-Datacenter"
    version             = "latest"

    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"

    nic_name       = "connect2"
    admin_username = "unms1"
    admin_password = "unms1234@1234"

  }
}


