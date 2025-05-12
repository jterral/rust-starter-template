# Tools
PIP ?= "$(shell which pip)"
PRECOMMIT ?= "$(shell which pre-commit)"


# ******************************************************************
##@ Precommit Tools

.PHONY: precommit-install
precommit-install:  ## Install precommit
	@echo -e "$(BCYAN)> Installing pre-commit hooks and dependencies...$(NORMAL)"
	@$(PIP) install pre-commit --break-system-packages

.PHONY: precommit-configure
precommit-configure:  ## Configure precommit hooks
	@echo -e "$(BCYAN)> Configuring Git hooks for pre-commit, commit-msg, and pre-push...$(NORMAL)"
	@$(PRECOMMIT) install --install-hooks
	@$(PRECOMMIT) install --hook-type commit-msg
	@$(PRECOMMIT) install --hook-type pre-push

.PHONY: precommit-update
precommit-update:  ## Update precommit hooks
	@echo -e "$(BCYAN)> Updating pre-commit hooks to latest versions...$(NORMAL)"
	@$(PRECOMMIT) autoupdate

.PHONY: precommit-uninstall
precommit-uninstall:  ## Uninstall precommit hooks
	@echo -e "$(BCYAN)> Removing all Git hooks and pre-commit configurations...$(NORMAL)"
	@$(PRECOMMIT) uninstall -t pre-commit -t pre-merge-commit -t pre-push -t prepare-commit-msg -t commit-msg -t post-commit -t post-checkout -t post-merge -t post-rewrite
