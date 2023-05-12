PLAYBOOK := "/usr/bin/ansible-playbook"
GALAXY := "/usr/bin/ansible-galaxy"
VAULT := "ansible-vault"
VAULT_FILE := "vars/vault.yml"
VAULT_PW_ARGS := "--vault-password-file .vpw"
TAGS := ""
ATAGS := if TAGS != "" { " --tags " + TAGS } else { "" }

default:
    just --list

# Decrypt the vault
decrypt:
    {{VAULT}} decrypt {{VAULT_PW_ARGS}} {{VAULT_FILE}}

# Encrypt the vault
encrypt:
    {{VAULT}} encrypt {{VAULT_PW_ARGS}} {{VAULT_FILE}}

# Install requirements
reqs:
    {{GALAXY}} install -r requirements.yml
    {{GALAXY}} collection install community.general

# Force install requirements
forcereqs:
    {{GALAXY}} install -r requirements.yml --force

# List available tags
tags:
    {{PLAYBOOK}} -b run.yml --list-tags {{VAULT_PW_ARGS}}

#test:
#    {{PLAYBOOK}} run.yml --check {{ATAGS}}

# Run everything - can use: make TAGS=tag1,tag2 run
run:
    {{PLAYBOOK}} -b run.yml {{VAULT_PW_ARGS}} {{ATAGS}}

# Tags Example
tagexample:
    @echo "just TAGS=clis,singlecli,cli=just test"
