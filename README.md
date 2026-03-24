# Terraform Azure Networking Modules Example

This repository demonstrates best practices for managing Azure networking infrastructure using Terraform modules. It structures resources for flexibility, reusability, and simplicity.

---

## 📁 Repository Structure

- **/vnet_module/**  
  Terraform module for provisioning an Azure Virtual Network and Subnet.
  - `main.tf`  
    Contains resource definitions for `azurerm_virtual_network` and `azurerm_subnet`.
  - `variables.tf`  
    Declares input variables required by the module (no default values—fully configurable).
  - `outputs.tf`  
    Exposes resource attributes (IDs, names, etc.) for use by parent modules or root configuration.

- **Root (Top-level)**
  - `main.tf`  
    Calls modules and ties together resources, passing in all required variables to modules.
  - `variables.tf`  
    Specifies the variables users must set when applying this configuration.
  - `outputs.tf`  
    Exposes outputs from modules (and other resources, such as VMs), making them available after `terraform apply`.

---

## 🧩 How Modules Work Here

- **Encapsulation:**  
  All logic to create a VNet and Subnet is inside `vnet_module`.  
- **No Hardcoded Defaults:**  
  Variables are defined without default values in the module, so the caller must provide them.
- **Inputs & Outputs:**  
  The module’s variables are set by the root module; the module’s outputs are referenced and passed up and can be exposed via the root’s outputs.

### Example: Using the Module in Root `main.tf`
```hcl
module "network" {
  source                = "./vnet_module"
  vnet_name             = var.vnet_name
  location              = var.location
  resource_group_name   = var.resource_group_name
  address_space         = var.address_space
  subnet_name           = var.subnet_name
  subnet_prefixes       = var.subnet_prefixes
}
```

### Example: Output Usage
```hcl
output "vnet_id" {
  value = module.network.vnet_id
}
```

---

## 🚀 Getting Started

### 1. Clone the repository

```sh
git clone https://github.com/ShubhamCyberStack/terraform-modules-best-practices-v2.git
cd terraform-modules-best-practices-v2
```

### 2. Configure your variables

Edit `terraform.tfvars` or provide variable values with `-var` arguments, supplying values for:

- `vnet_name`
- `location`
- `resource_group_name`
- `address_space`
- `subnet_name`
- `subnet_prefixes`

### 3. Initialize and apply

```sh
terraform init
terraform apply
```

---

## 🏗️ Features

- Modular, reusable network infrastructure code
- No hardcoded defaults: all parameters supplied externally
- Explicit outputs for easy integration with downstream resources

---

## 📢 Notes

- This code requires you to provision (or reference) an Azure resource group before using the network module.
- Outputs from the module and root are easily accessible for use in other infrastructure code (like VM provisioning).

---

## 📚 Reference: File Overview

| File/Folder        | Purpose                                                           |
|--------------------|-------------------------------------------------------------------|
| `/vnet_module/`    | Terraform module: VNet + Subnet resources                        |
| `/main.tf`         | Root module; wires modules/resources together                     |
| `/variables.tf`    | Specifies user-supplied inputs                                    |
| `/outputs.tf`      | Exposes key information for use in other stacks/scripts           |

---

## 🛡️ Best Practices Shown

- Use modules for logical grouping and code reduction
- No variable defaults inside modules (for flexibility)
- Outputs exposed cleanly at each layer
- Separation of concerns between root and child modules

---

## 🤝 Contributing

Feel free to fork or make pull requests for improvements!

---

**Author:** [ShubhamCyberStack](https://github.com/ShubhamCyberStack)
