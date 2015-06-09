#
# This is a sample dev server config.
#
# !!   IT IS INSECURE   !!
# !! DO NOT USE IN PROD !!
#

backend "inmem" {}

listener "tcp" { 
 address = "0.0.0.0:8200" 
 tls_disable = 1 
}

disable_mlock = true
