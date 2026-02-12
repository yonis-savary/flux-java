include .env
export

up:
	@docker compose build
	@docker compose up -d
	@docker compose logs --follow

up-dev:
	@docker compose -f compose.dev.yml build --no-cache
	@docker compose -f compose.dev.yml up -d
	@docker compose -f compose.dev.yml logs --follow

down:
	@docker compose down
	@docker compose -f compose.dev.yml down

models:
	@docker compose -f compose.dev.yml exec api mvn hibernate-tools:hbm2java \
	-Ddb.url=${DB_URL} \
	-Ddb.user=${DB_USER} \
	-Ddb.pass=${DB_PASSWORD}