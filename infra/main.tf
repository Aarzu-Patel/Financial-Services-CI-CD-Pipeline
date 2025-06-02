
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-financial-app"
  location = "East US"
}

resource "azurerm_app_service_plan" "plan" {
  name                = "asp-financial"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "app" {
  name                = "financial-app-service"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.plan.id

  site_config {
    node_version = "~20"
  }

  app_settings = {
    "WEBSITE_NODE_DEFAULT_VERSION" = "~20"
  }
}
