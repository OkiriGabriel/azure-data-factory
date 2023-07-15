data "azurerm_storage_account" "example" {
  name                = "storageaccountname"
  resource_group_name = azurerm_resource_group.azure-df-rg.name
}


resource "azurerm_resource_group" "azure-df-rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_data_factory" "azure-df" {
  name                = var.azure-df_name
  resource_group_name = azurerm_resource_group.azure-df-rg.name
  location            = var.location
}


resource "azurerm_storage_account" "sourcestorage" {
  name                     = "sourcestorage"
  resource_group_name      = azurerm_resource_group.azure-df-rg.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "adf-container-source" {
  name                  = "container-source"
  storage_account_name  = azurerm_storage_account.sourcestorage.name
  container_access_type = "private"
}

resource "azurerm_storage_account" "destinationstorage" {
  name                     = "destinationstorage"
  resource_group_name      = azurerm_resource_group.azure-df-rg.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "adf-container-destination" {
  name                  = "container-destination"
  storage_account_name  = azurerm_storage_account.sourcestorage.name
  container_access_type = "private"
}

resource "azurerm_data_factory_linked_service_azure_blob_storage" "source" {
  name              = "source-storage"
  data_factory_id = azurerm_data_factory.azure-df.name
    connection_string = "connectionstring"
}

resource "azurerm_data_factory_linked_service_azure_blob_storage" "example" {
  name              = "destination-storage"
   data_factory_id = azurerm_data_factory.azure-df.name
  connection_string = "connectionstring"
}
