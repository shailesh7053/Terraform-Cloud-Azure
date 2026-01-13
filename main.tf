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

resource "azurerm_resource_group" "StorageAccount" {
  name     = "storage-acc-rg"
  location = "East US"
}

resource "azurerm_storage_account" "StorageAccount" {
  name                     = "storage-acc-01"
  resource_group_name      = azurerm_resource_group.StorageAccount.name
  location                 = azurerm_resource_group.StorageAccount.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}
