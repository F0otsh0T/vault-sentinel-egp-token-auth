# 02-01.vault.policies.tf

################################################
# VAULT POLICIES

resource "vault_policy" "vault_admin" {
  name   = "vault-admin"
  policy = templatefile("${path.module}/templates/vault_admin_policy.tpl", {})
}

resource "vault_policy" "vault_github_secret_read" {
  name   = "vault-github-secret-read"
  policy = templatefile("${path.module}/templates/vault_github_read_policy.tpl", {})
}


################################################
# VAULT SENTINEL POLICIES - ENDPOINT GOVERNING POLICIES (EGP)
# HCP Vault Enterprise Plus Tier Needed
# Self-Managed Vault Enterprise - `governance-policy` feature flag needed

# resource "vault_egp_policy" "vault_egp" {
#   name              = "egp-vault-test"
#   paths             = ["*"]
#   enforcement_level = "soft-mandatory"
#   policy            = templatefile("${path.module}/templates/egp.sentinel", {})
# }

