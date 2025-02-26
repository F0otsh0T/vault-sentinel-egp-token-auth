# 02-03.vault.secrets.tf

################################################
# VAULT SECRETS ENGINE: KVv2

resource "vault_mount" "egpvaultkv" {
  type        = "kv"
  description = "KVv2 Secret Engine Mount"
  options     = { version = "2" }
  path        = "egpkvv2"
}

resource "vault_kv_secret_v2" "egpvaultkv01" {
  mount               = vault_mount.egpvaultkv.path
  name                = "egpvaultkv01"
  cas                 = 1
  delete_all_versions = true
  data_json = jsonencode(
    {
      zip = "zap1",
      foo = "bar1"
    }
  )
}

resource "vault_kv_secret_v2" "egpvaultkv02" {
  mount               = vault_mount.egpvaultkv.path
  name                = "egpvaultkv02"
  cas                 = 1
  delete_all_versions = true
  data_json = jsonencode(
    {
      zip = "zap2",
      foo = "bar2"
    }
  )
}





