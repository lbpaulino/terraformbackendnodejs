# Configurando Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }
  required_version = ">= 0.14.9"
}
provider "azurerm" {
  features {}
}
# Gere um número inteiro aleatório para criar um nome globalmente exclusivo
resource "random_integer" "ri" {
  min = 10000
  max = 99999
}
# Criar o grupo de recursos
resource "azurerm_resource_group" "rg" {
  name     = "myResourceGroup-${random_integer.ri.result}"
  location = "eastus"
}
# Criar o Plano de Serviço de Aplicativo do Linux
resource "azurerm_app_service_plan" "appserviceplan" {
  name                = "webapp-asp-${random_integer.ri.result}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku {
    tier = "Free"
    size = "F1"
  }
}
# Crie o aplicativo Web, passe a ID do Plano de Serviço de Aplicativo e implante o código de um repositório público do GitHub
resource "azurerm_app_service" "webapp" {
  name                = "webapp-${random_integer.ri.result}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.appserviceplan.id
  source_control {
    repo_url           = "https://github.com/mrdouglasmorais/terraformbackendnodejs"
    branch             = "main"
    manual_integration = true
    use_mercurial      = false
  }
}