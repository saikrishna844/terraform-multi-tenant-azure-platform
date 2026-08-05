variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "vnet_name" {
  description = "Virtual network name for the selected client"
  type        = string
}

variable "address_space" {
  default = ["10.0.0.0/16"]
}

variable "subnet_names" {
  default = [
    "subnet-web",
    "subnet-app",
    "subnet-db"
  ]
}

variable "subnet_prefixes" {
  default = [
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24"
  ]
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}

/* variable "admin_password" {
  description = "Administrator password for Windows VMs"
  type        = string
  sensitive   = true
} */

variable "enable_rbac_assignments" {
  description = "Create Azure role assignments when the deploying identity has RBAC administration permission"
  type        = bool
  default     = false
}

variable "enable_policy_assignments" {
  description = "Enable Azure Policy assignments in environments where permissions allow them"
  type        = bool
  default     = false
}

variable "admin_password" {
  description = "Administrator password for Windows virtual machines"
  type        = string
  sensitive   = true
}

variable "client_name" {
  description = "Logical client name used for naming and tagging."
  type        = string
}


variable "owner" {
  description = "Resource owner tag."
  type        = string
  default     = "Sai Krishna"
}

variable "cost_center" {
  description = "Cost center tag."
  type        = string
  default     = "Cloud"
}


variable "environment" {
  description = "Environment name such as dev, test, or prod."
  type        = string

  validation {
    condition = contains(
      ["dev", "test", "prod"],
      lower(var.environment)
    )

    error_message = "Environment must be dev, test, or prod."
  }
}



variable "unique_suffix" {
  description = "Unique suffix for globally unique Azure resource names."
  type        = string
}

variable "admin_username" {
  description = "Administrator username for virtual machines."
  type        = string
  default     = "azureadmin"
}

variable "alert_email_address" {
  description = "Email used by the Azure Monitor action group."
  type        = string
}

variable "allowed_locations" {
  type = list(string)

  default = [
    "centralindia"
  ]
}

variable "allowed_vm_sizes" {
  type = list(string)

  default = ["Standard_DS1_v2"
  ]
}

variable "vm_size" {
  description = "Virtual machine size"
  type        = string
  default     = "Standard_DS1_v2"
}

variable "bastion_subnet_prefix" {
  description = "CIDR prefix for the AzureBastionSubnet"
  type        = string
}

variable "private_endpoint_subnet_prefix" {
  description = "CIDR prefix for the private endpoint subnet"
  type        = string
}