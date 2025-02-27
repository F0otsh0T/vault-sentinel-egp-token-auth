---
title: HashiCorp Vault Sentinel EGP
description: Vault Sentinel EGP for KV v2
---

# HashiCorp Vault Sentinel EGP



#### STEPS


###### Prerequisites
- HashiCorp Vault
- Terraform
- Credentials and Environment Variables
  - `VAULT_ADDR`
  - `VAULT_NAMESPACE` (if other than root)
  - `VAULT_TOKEN`

###### Set up Vault Resources
- Terraform
    ```shell
    cd terraform

    terraform init

    terraform plan

    terraform apply --auto-approve
    ```
    - EGP Sentinel policy is at `~/terraform/templates/egp.01.00.sentinel`
    - 
- Create Token utilizing Auth Token Role created by Terraform named `demo-example-token-role`. Use this Token (`export VAULT_TOKEN="{{TOKEN_FROM_THIS_STEP}}") for testing the Sentinel EGP.
    ```shell
    vault token create -role=demo-example-token-role
    Key                  Value
    ---                  -----
    token                hvs.blahblahblah
    token_accessor       oW1jblahblahblah
    token_duration       24h
    token_renewable      true
    token_policies       ["vault-admin"]
    identity_policies    []
    policies             ["vault-admin"]
    ```
###### Test Steps
- Read Secrets (allowed for `egpvaultkv01` but denied for `egpvaultkv02`)
    ```shell
    vault kv get -mount=egpkvv2 egpvaultkv01

    vault kv get -mount=egpkvv2 egpvaultkv02
    ```
- Delete KV v2 Secrets (denied - `delete` operation)
    ```shell
    vault kv delete -mount=egpkvv2 egpvaultkv01

    vault kv delete -mount=egpkvv2 egpvaultkv02
    ```
- Destroy KV v2 Secrets Versions (allowed - `update` operations)
    ```shell
    vault kv destroy -mount=egpkvv2 -versions=1,2,3,4,5 egpvaultkv01

    vault kv destroy -mount=egpkvv2 -versions=1,2,3,4,5 egpvaultkv02
    ```
- Permanently KV v2 Secrets (denied - `delete` operation)
    ```shell
    vault kv metadata delete egpkvv2/egpvaultkv01

    vault kv metadata delete egpkvv2/egpvaultkv02
    ```

---
## APPENDIX
#### REFERENCES
###### DOCUMENTS
- https://developer.hashicorp.com/vault/docs/enterprise/sentinel/
- https://developer.hashicorp.com/vault/docs/enterprise/sentinel/properties
- https://developer.hashicorp.com/vault/docs/enterprise/sentinel/examples
- https://developer.hashicorp.com/vault/docs/enterprise/sentinel/properties
###### TUTORIALS / EXAMPLES
- https://github.com/hashicorp/vault-guides/blob/master/governance/sentinel/README.md
- https://github.com/hashicorp/vault-guides/blob/master/governance/sentinel/inline-iam-actions.sentinel
- https://developer.hashicorp.com/vault/tutorials/policies/sentinel#endpoint-governing-policies-egps
###### VAULT KV V2
- https://developer.hashicorp.com/vault/tutorials/secrets-management/versioned-kv#delete-versions-of-secret
- https://developer.hashicorp.com/vault/tutorials/secrets-management/versioned-kv#permanently-delete-data

###### MISC
- https://medium.com/hashicorp-engineering/elegant-cert-governance-with-vault-identity-and-sentinel-policy-53943bd5e044
- 




