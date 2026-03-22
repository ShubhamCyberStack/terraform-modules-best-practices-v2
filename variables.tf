variable "resource_group_name" {
  description = "name of the resource group"
  type = string
  default = "myResourceGroup"
}

variable "location" {
    description = "location of resource group"
    type = string
    default = "centralindia"
}

variable "vnet_name" {
    description = "name of the virtual network"
    type = string
    default = "my_vnet"  
}

variable "address_space" {
    description = "address space for the virtual network"
    type = list(string)
    default = ["10.0.0.0/16"]
}

variable "subnet_name" {
  description = "name of the subnet"
  type = string
  default = "my_subnet"
}

variable "subnet_prefixes" {
    description = "address space for subnet"
    type = list(string)
    default = ["10.0.1.0/24"]
}

variable "nic_name" {
    description = "name of the network interface"
    type = string
    default = "my_nic"
}

variable "computer_name" {
    description = "name of the computer"
    type = string
    default = "OS"
  
}
variable "vm_name" {
  description = "Name of the virtual machine"
  type       = string
  default = "shubhamvm"
}

variable "vm_size" {
  description = "Size of the virtual machine"
  type       = string
  default = "Standard_D2s_v3"
}

variable "username" {
  description = "Username for the administrator account"
  type       = string
  default = "adminuser"
}

variable "admin_password" {
  description = "Password for the administrator account"
  type       = string
  sensitive = true
}