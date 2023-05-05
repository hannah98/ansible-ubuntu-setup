#!/bin/bash

if ( git show :vars/vault.yml | grep -q "\$ANSIBLE_VAULT;" ); then
    echo "Vault Encrypted. Safe to commit."
else
    echo "Vault not encrypted! Run 'make encrypt' and try again."
    exit 1
fi
