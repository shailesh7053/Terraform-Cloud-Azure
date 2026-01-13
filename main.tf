terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.57.0"
    }
  }
  required_version = ">1.9.0"
}

provider "azurerm" {
  features{
  }
}

resource "azurerm_resource_group" "storageaccount" {
  name     = "storageacc-rg"
  location = "East US"
}

resource "azurerm_storage_account" "storageaccount" {
  name                     = "storageacc01"
  resource_group_name      = azurerm_resource_group.storageaccount.name
  location                 = azurerm_resource_group.storageaccount.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}
