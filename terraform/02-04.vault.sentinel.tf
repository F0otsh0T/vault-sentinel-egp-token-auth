# 02-04.vault.sentinel.tf

################################################
# VAULT SENTINEL POLICIES - ENDPOINT GOVERNING POLICIES (EGP)
# HCP Vault Enterprise Plus Tier Needed
# Self-Managed Vault Enterprise - `governance-policy` feature flag needed

resource "vault_egp_policy" "vault_egp" {
  name              = "egp-vault-test"
  paths             = ["*"]
  enforcement_level = "soft-mandatory"
  # enforcement_level = "advisory"
  # policy            = templatefile("${path.module}/templates/egp.navi.sentinel", {})
  policy            = templatefile("${path.module}/templates/egp.01.00.sentinel", {})
}

