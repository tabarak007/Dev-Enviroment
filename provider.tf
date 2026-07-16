terraform {
   backend "azurerm" {
    resource_group_name  = "rg-backend"
    storage_account_name = "tabarak007"
    container_name       = "hussain007"
    key                  = "module.tfstate"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.80.0"
    }
  }
}
provider "azurerm" {
  features {}
}