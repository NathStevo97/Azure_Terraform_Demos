#create resource group
resource "azurerm_resource_group" "RG_Demo_01" {
	name	= "${var.prefix}-resources"
	location = "${var.region}"
}

resource "azurerm_virtual_network" "VNetwork_Demo_01" {
  name                = "${var.prefix}-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.RG_Demo_01.location
  resource_group_name = azurerm_resource_group.RG_Demo_01.name
}

resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.RG_Demo_01.name
  virtual_network_name = azurerm_virtual_network.VNetwork_Demo_01.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "Network_Interface_Demo_01" {
  name                = "${var.prefix}-nic"
  location            = azurerm_resource_group.RG_Demo_01.location
  resource_group_name = azurerm_resource_group.RG_Demo_01.name

  ip_configuration {
    name                          = "Demo_Configuration_01"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
  }
}