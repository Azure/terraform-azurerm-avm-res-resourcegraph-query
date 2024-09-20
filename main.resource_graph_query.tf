data azurerm_resource_group "this" {
name = var.resource_group_name
}


resource "azapi_resource" "query" {
  type = "Microsoft.ResourceGraph/queries@2018-09-01-preview"
  name = var.name
  location = var.location
  parent_id = data.azurerm_resource_group.this.id
    tags = var.tags
  body = jsonencode({
    properties = {
      description = var.description
      query = var.query_string
    }
    
  })
}
