module "data_factory_module" {
  source = "./resource"

  resource_group_name    = var.resource_group_name
  location               = var.location
  azure_df_name          = var.azure_df_name
  source_storage_name    = var.source_storage_name
  destination_storage_name = var.destination_storage_name
}