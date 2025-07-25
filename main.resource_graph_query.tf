data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}


resource "azapi_resource" "query" {
  location  = var.location
  name      = var.name
  parent_id = data.azurerm_resource_group.this.id
  type      = "Microsoft.ResourceGraph/queries@2018-09-01-preview"
  body = {
    properties = {
      description = var.description
      query       = var.query_string
    }

  }
  tags = var.tags
}
