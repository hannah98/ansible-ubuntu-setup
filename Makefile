.DEFAULT_GOAL:=help

PLAYBOOK=/usr/bin/ansible-playbook
GALAXY=/usr/bin/ansible-galaxy
VAULT=ansible-vault
VAULT_FILE=vars/vault.yml
VAULT_PW_ARGS=--vault-password-file .vpw

ifdef TAGS
ATAGS :=  --tags $(TAGS) 
else
ATAGS := 
endif

tags: ## list availble tags
	$(PLAYBOOK) -b run.yml --list-tags $(VAULT_PW_ARGS)

	#$(PLAYBOOK) -b run.yml --check --tags externalfacing --limit externalfacing $(VAULT_PW_ARGS)
test:
	$(PLAYBOOK) run.yml --check $(ATAGS)

run: ## Run everything - can use: make TAGS=tag run
	$(PLAYBOOK) -b run.yml $(VAULT_PW_ARGS) $(ATAGS)

decrypt: ## Decrypt the vault
	$(VAULT) decrypt $(VAULT_PW_ARGS) $(VAULT_FILE)

encrypt: ## Encrypt the vault
	$(VAULT) encrypt $(VAULT_PW_ARGS) $(VAULT_FILE)

reqs: ## Install the Galaxy requirements
	$(GALAXY) install -r requirements.yml
	$(GALAXY) collection install community.general

forcereqs: ## Install the Galaxy requirements (forced)
	$(GALAXY) install -r requirements.yml --force

gitinit: ## Initialize git pre-commit hook
	@./git-init.sh
	@echo "ansible vault pre-commit hook installed"
	@echo "don't forget to create a .vault-password too"

help: ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m\033[0m\n"} /^[$$()% a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
