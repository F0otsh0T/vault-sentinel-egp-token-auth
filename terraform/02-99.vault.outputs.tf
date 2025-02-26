# 02-99.vault.outputs.tf

# output "" {
#   value = 
#   description = ""
# }

################################################
# VAULT OUTPUTS
################################################


output "vault_demo_token" {
  value       = vault_token.demo_example_token.client_token
  description = "Vault Token for Demo"
  sensitive   = true
}

output "vault_egp_kvv2_egpvaultkv01_path" {
  value       = vault_kv_secret_v2.egpvaultkv01.path
  description = "Azure Secrets Path for egpvaultkv01"
}

output "vault_egp_kvv2_egpvaultkv02_path" {
  value       = vault_kv_secret_v2.egpvaultkv02.path
  description = "Azure Secrets Path for egpvaultkv02"
}

output "github_role_setup_name" {
  value       = vault_jwt_auth_backend_role.github_role_setup.role_name
  description = "GitHub Setup Role Name"
}

output "github_role_actions_name" {
  value       = vault_jwt_auth_backend_role.github_role_actions.role_name
  description = "GitHub Actions Role Name"
}



