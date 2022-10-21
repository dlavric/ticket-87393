terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.11"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.22.0"
    }
  }
}


provider "azurerm" {
  features {}
}

provider "azuread" {

}


resource "azuread_administrative_unit" "example" {
  display_name = "Example-AU"
  description  = "Just an example"
}