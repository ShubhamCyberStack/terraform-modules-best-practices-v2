output "resource_group_name" {
    description = "name of the resource group"
    value = azurerm_resource_group.rg.name
}
output "vnet_id" {
    description = "ID of the virtual network"
    value = module.network.vnet_id
}

output "subnet_id" {
    description = "ID of the subnet"
  value = module.network.subnet_id
}

output "vm_name" {
    description = "name of the virtual machine"
    value = azurerm_virtual_machine.vm.name
}

output "vm_private_ip" {
    description = "private IP address of the virtual machine"
    value = azurerm_network_interface.nic.private_ip_address
}
