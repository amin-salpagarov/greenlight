include .env

migrate-up:
	docker exec -it golang_container goose -dir ./migrations postgres "host=${PG_HOST} user=${PG_USER} password=${PG_PASSWORD} dbname=${PG_DB_NAME} sslmode=disable" up

migrate-down:
	docker exec -it golang_container goose -dir ./migrations postgres "host=${PG_HOST} user=${PG_USER} password=${PG_PASSWORD} dbname=${PG_DB_NAME} sslmode=disable" down

local:
	cp .env.example .env

up: down local
	docker-compose up --build golang

down:
	docker-compose down




dlt_main:
	@sed -i '/^\s*\/\/.*/d' ./cmd/api/main.go