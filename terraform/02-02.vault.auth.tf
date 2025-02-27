# 02-03.vault.auth.tf


################################################
# AUTH: TOKEN
# Token Auth for Azure Secrets

resource "vault_token" "demo_example_token" {
  depends_on = [
    vault_token_auth_backend_role.demo_example_token_role,
  ]
  role_name = "demo-example-token-role"
  policies = [
    "vault-admin",
    # "vault-github-secret-read",
  ]
  renewable       = true
  ttl             = "48h"
  renew_min_lease = 43200
  renew_increment = 86400
  metadata = {
    "purpose" = "egp-secrets",
  }
}

resource "vault_token_auth_backend_role" "demo_example_token_role" {
  role_name = "demo-example-token-role"
  allowed_policies = [
    # "vault-github-secret-read",
    "vault-admin",
  ]
  disallowed_policies = [
    "default",
  ]
  renewable              = true
  orphan                 = true
  token_period           = 86400
  token_explicit_max_ttl = 172800
}


################################################
# AUTH: OIDC / JWT
# GitHub <=> Vault Auth
# https://docs.github.com/en/actions/security-for-github-actions/security-hardening-your-deployments/configuring-openid-connect-in-hashicorp-vault

resource "vault_jwt_auth_backend" "github" {
    description         = "GitHub OIDC or JWT Auth"
    path                = "jwt-github"
    oidc_discovery_url  = "https://token.actions.githubusercontent.com"
    bound_issuer        = "https://token.actions.githubusercontent.com"
}

resource "vault_jwt_auth_backend_role" "github_role_setup" {
  backend           = vault_jwt_auth_backend.github.path
  role_name         = "github_role_setup"
  role_type         = "jwt"
  user_claim        = "actor"
  bound_claims_type = "string"
  bound_audiences   = [
    var.github_bound_audience
  ]
  token_policies = [
    vault_policy.vault_github_secret_read.name,
  ]
  bound_claims = {
    repository = "F0otsh0T/vault-sentinel-egp-token-auth"
  }
}

resource "vault_jwt_auth_backend_role" "github_role_actions" {
  backend           = vault_jwt_auth_backend.github.path
  role_name         = "github_role_actions"
  role_type         = "jwt"
  user_claim        = "actor"
  bound_claims_type = "string"
  bound_audiences   = [
    var.github_bound_audience
  ]
  token_policies = [
    vault_policy.vault_github_secret_read.name,
  ]
  bound_claims = {
    repository = "F0otsh0T/vault-sentinel-egp-token-auth-github-action"
  }
}
