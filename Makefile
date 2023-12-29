.DEFAULT_GOAL := help

.PHONY: requirements
requirements: venv ## Install requirements

.PHONY: serve
serve: requirements venv ## Start the development server
	$(VENV)/mkdocs serve

.PHONY: build
build: requirements venv ## Build the documentation
	$(VENV)/mkdocs build

.PHONY: deploy
deploy: build ## Deploy the documentation
	$(VENV)/mkdocs gh-deploy

.PHONY: clean
clean: venv ## Clean directory
	$(MAKE) clean-venv

.PHONY: help
help: ## Display this help screen
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' Makefile | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

include Makefile.venv
Makefile.venv:
	curl \
		-o Makefile.fetched \
		-L "https://github.com/sio/Makefile.venv/raw/v2023.04.17/Makefile.venv"
	echo "fb48375ed1fd19e41e0cdcf51a4a0c6d1010dfe03b672ffc4c26a91878544f82 *Makefile.fetched" \
		| sha256sum --check - \
		&& mv Makefile.fetched Makefile.venv
