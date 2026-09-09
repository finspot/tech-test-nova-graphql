# Shortcuts for the commands in the README. `make` on its own lists them.
#
# Nothing here is magic: every target is one line you could type yourself.
# DATABASE_PORT is honoured throughout, e.g. `DATABASE_PORT=5434 make setup`.

.DEFAULT_GOAL := help
.PHONY: help setup up down server console test seed schema

help: ## List the available targets
	@awk -F':.*## ' '/^[a-z-]+:.*##/ { printf "  make %-8s %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

setup: up ## Start PostgreSQL, install the gems, create and seed the databases
	bundle install
	bundle exec rake db:prepare

up: ## Start the bundled PostgreSQL and wait for it to accept connections
	docker compose up -d --wait

down: ## Stop the bundled PostgreSQL
	docker compose down

server: ## Serve the API on http://localhost:3000
	bundle exec rails server

console: ## Open a Rails console
	bundle exec rails console

test: ## Run the specs
	bundle exec rspec

seed: ## Reload the sample data
	bundle exec rake db:seed

schema: ## Regenerate schema.graphql from the code
	bundle exec rake graphql:schema_dump
