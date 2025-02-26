# 00.variables.tf

# variable "" {
#     type = string
#     description = ""
#     sensitive = false
#     default = ""
# }

################################################
# DEMO VARIABLES

variable "user" {
  type        = string
  description = "Demo User"
  sensitive   = false
  default     = "demouser"
}

################################################
# HCP VARIABLES

variable "hcp_project_id" {
  type        = string
  description = "HCP Project ID"
  sensitive   = false
  default     = ""
}

variable "hcp_client_id" {
  type        = string
  description = "HCP Client ID"
  sensitive   = false
  default     = ""
}

variable "hcp_client_secret" {
  type        = string
  description = "HCP Client Secret"
  sensitive   = true
  default     = ""
}


################################################
# AZURE VARIABLES

variable "azure_tenant_id" {
  type        = string
  description = "Azure Tenant ID"
  sensitive   = false
  default     = ""
}

variable "azure_user_object_id" {
  type        = string
  description = "Azure User Object ID"
  sensitive   = false
  default     = ""
}

variable "azure_subscription_id" {
  type        = string
  description = "Azure Subscription ID"
  sensitive   = false
  default     = ""
}

variable "azure_environment" {
  type        = string
  description = "Azure Environment"
  sensitive   = false
  default     = "AzurePublicCloud"
}

variable "azure_region" {
  type        = string
  description = "Azure Region"
  sensitive   = false
  default     = "westus2"
}

################################################
# VAULT VARIABLES

# variable "vault_root_token" {
#   type        = string
#   description = "Vault Root Token"
#   sensitive   = false
#   default     = ""
# }

variable "vault_namespace" {
  type        = string
  description = "Vault Namespace"
  sensitive   = false
  default     = "admin"
}

variable "vault_url" {
  type        = string
  description = "Vault URL"
  sensitive   = false
  default     = "http://localhost:8200"
  # default     = hcp_vault_cluster.demo_vault.vault_public_endpoint_url
}

variable "vault_port" {
  type        = string
  description = "Vault Port"
  sensitive   = false
  default     = "8200"
}

variable "vault_cli_port" {
  type        = string
  description = "Vault CLI Port"
  sensitive   = false
  default     = "8250"
}

# variable "vault_auth_mount_path" {
#   type        = string
#   description = "Vault Authentication Mount Path"
#   sensitive   = false
#   default     = "oidc-azure"
# }

################################################
# GITHUB VARIABLES

variable "github_pat_token" {
  type        = string
  description = "GitHub Personal Access Token"
  sensitive   = true
  default     = ""
}

# variable "GITHUB_TOKEN" {
#   type        = string
#   description = "GitHub Token"
#   sensitive   = true
#   default     = ""
# }

variable "github_bound_audience" {
  type        = string
  description = "GitHub Bound Audience"
  sensitive   = false
  default     = "https://github.com/"
}


