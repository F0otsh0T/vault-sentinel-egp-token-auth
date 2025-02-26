# 00.versions.tf

terraform {
  required_version = ">= 0.13"

  required_providers {
    # hcp = {
    #   source  = "hashicorp/hcp"
    #   version = ">=0.102.0"
    # }
    vault = {
      source  = "hashicorp/vault"
      version = ">= 4.6.0"
    }
    # azuread = {
    #   source  = "hashicorp/azuread"
    #   version = ">= 3.1.0"
    # }
    # azurerm = {
    #   source  = "hashicorp/azurerm"
    #   version = ">= 4.17.0"
    # }
    github = {
      source  = "integrations/github"
      version = ">=6.5.0"
    }
    # doormat = {
    #   source  = "doormat.hashicorp.services/hashicorp-security/doormat"
    #   version = "~> 0.0.2"
    # }
  }
}

# locals {
#   vault_root_token  = var.vault_root_token
#   vault_url         = var.vault_url
#   vault_port        = var.vault_port
#   vault_cli_port    = var.vault_cli_port
# }

provider "vault" {
  # address = hcp_vault_cluster.demo_vault.vault_public_endpoint_url
  # token   = hcp_vault_cluster_admin_token.demo_vault_token.token
  # address = var.vault_url
  #  address = "${var.vault_url}:${var.vault_port}"
  #  token   = var.vault_root_token
  #  skip_child_token = true
}

provider "azurerm" {
  #
  features {}
  subscription_id = var.azure_subscription_id
}


provider "azuread" {
  #

}

resource "random_pet" "example" {
  #

}

# Configure the GitHub Provider
provider "github" {
  token = var.github_pat_token # or `GITHUB_TOKEN`
}

# Configure the HCP Provider
# HCP Service Principal
# provider "hcp" {
#   client_id     = var.hcp_client_id
#   client_secret = var.hcp_client_secret
#   project_id    = var.hcp_project_id
# }