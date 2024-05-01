include .env

dlt_main:
	@sed -i '/^\s*\/\/.*/d' ./cmd/api/main.go

migrate:
	source .env && migrate -path=./migrations -database=$GREENLIGHT_DB_DSN up
migrate_down:
	source .env && migrate -path=./migrations -database=$GREENLIGHT_DB_DSN down

connect_db:
	docker exec -it postgres /bin/bash && psql -U postgres