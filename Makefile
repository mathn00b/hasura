up: ## up
	@cd ci/dev && docker-compose up --renew-anon-volumes --remove-orphans

up-m1: ## ## up Apple M1 compose
	@cd ci/dev:m1 && docker-compose -p sbo up -d --build

down-m1: ## ## up Apple M1 compose
	@cd ci/dev:m1 && docker-compose -p sbo down

down: ## down
	@cd ci/dev && docker-compose down

hasura-update: # update hasura to last state
	@make migration-up
	@make metadata-up

migration-up: # apply all migrations
	@hasura --project hasura migrate apply --admin-secret myadminsecretkey --database-name default

migration-up-1: # apply 1 migration-up
	@hasura --project hasura migrate apply --up 1 --admin-secret myadminsecretkey --database-name default

migration-down-1: # apply 1 migration-down
	@hasura --project hasura migrate apply --down 1 --admin-secret myadminsecretkey --database-name default

migration-create: # «name=migration_name» as argument
	@hasura --project hasura migrate create $(name) --admin-secret myadminsecretkey --database-name default

migration-status:
	@hasura --project hasura migrate status --database-name default

metadata-up:
	@hasura --project hasura metadata apply --admin-secret myadminsecretkey

metadata-export: #metadata-export
	@hasura --project hasura metadata export --admin-secret myadminsecretkey

console-hasura: #console-hasura
	@cd hasura && hasura console --admin-secret myadminsecretkey

# --- Utility commands ---

.PHONY: help
help: ## Display this help screen
	@grep -E '^[^\:]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ": .*?## "}; {gsub(/[\\]*/,""); printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
