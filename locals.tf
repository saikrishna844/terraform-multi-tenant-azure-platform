/*locals {

  common_tags = {

    Project = "Azure Enterprise Landing Zone"

    Owner = "Sai Krishna"

    Environment = "Development"

    ManagedBy = "Terraform"

    CreatedBy = "Terraform"

    CostCenter = "Cloud"

  }
  subnet_nsg_map = {
    "subnet-web" = module.web_nsg.id
    "subnet-app" = module.app_nsg.id
    "subnet-db"  = module.db_nsg.id

  }

} */

locals {
  # Azure resource names are easier to manage using a standardized suffix.
  name_suffix = "${lower(var.client_name)}-${lower(var.environment)}"

  common_tags = {
    Project     = "Terraform Multi-Tenant Azure Platform"
    Client      = var.client_name
    Owner       = var.owner
    Environment = var.environment
    ManagedBy   = "Terraform"
    CreatedBy   = "Terraform"
    CostCenter  = var.cost_center
  }

  resource_names = {
    web_nsg                    = "nsg-web-${local.name_suffix}"
    app_nsg                    = "nsg-app-${local.name_suffix}"
    db_nsg                     = "nsg-db-${local.name_suffix}"
    web_route_table            = "rt-web-${local.name_suffix}"
    storage_account            = lower(replace("st${var.client_name}${var.environment}${var.unique_suffix}", "-", ""))
    key_vault                  = lower("kv-${local.name_suffix}-${var.unique_suffix}")
    log_analytics              = "law-${local.name_suffix}"
    diagnostic_setting         = "diag-storage-blob-${local.name_suffix}"
    web_vm                     = "vm-web-${local.name_suffix}"
    app_vm                     = "vm-app-${local.name_suffix}"
    db_vm                      = "vm-db-${local.name_suffix}"
    recovery_vault             = "rsv-${local.name_suffix}"
    backup_policy              = "bp-${local.name_suffix}-daily"
    action_group               = "ag-${local.name_suffix}"
    bastion                    = "bas-${local.name_suffix}"
    bastion_public_ip          = "pip-bastion-${local.name_suffix}"
    storage_private_endpoint   = "pe-storage-${local.name_suffix}"
    key_vault_private_endpoint = "pe-keyvault-${local.name_suffix}"
  }

  subnet_nsg_map = {
    "subnet-web" = module.web_nsg.id
    "subnet-app" = module.app_nsg.id
    "subnet-db"  = module.db_nsg.id
  }
}

