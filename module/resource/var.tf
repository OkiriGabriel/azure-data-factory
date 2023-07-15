variable "resource_group_name" {
  description = "Name of the resource group"
  default = "test"
}

variable "location" {
  description = "Azure location for the resource group"
  default = "EastUs"
}

variable "azure-df_name" {
    description = "Azure data factory name"
  default = "azure-df_name"
}