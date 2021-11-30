.PHONY: help

help: ## Print command list
	@perl -nle'print $& if m{^[a-zA-Z0-9_-]+:.*?## .*$$}' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

# _prepare:
# 	@git submodule update --init --recursive

# bootstrap: _prepare dotfiles _bootstrap macos ## Bootstrap new machine

bootstrap:
	chezmoi init

dotfiles: ## Update dotfiles
	chezmoi apply -i files

apply: ## Run chezmoi apply
	@chezmoi apply

# macos: ## Run macos script
# 	chezmoi cat ~/.chezmoi_scripts/98-macos-preferences.sh | bash
# 	chezmoi cat ~/.chezmoi_scripts/99-macos-name.zsh | zsh

