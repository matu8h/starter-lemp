include .env
export $(shell sed 's/=.*//' .env)

build:
	docker compose down
	docker compose build --no-cache
	docker compose up -d
	docker cp scripts/update-hosts.sh $(COMPOSE_PROJECT_NAME)-php:/update-hosts.sh
	docker exec $(COMPOSE_PROJECT_NAME)-php sh /update-hosts.sh

start:
	docker compose up -d

stop:
	docker compose down

restart:
	docker compose down --remove-orphans
	docker compose up -d

update_media:
	sh pull-uploads.sh

shell:
	docker exec -it $(COMPOSE_PROJECT_NAME)-nginx sh


shell_php:
	docker exec -it $(COMPOSE_PROJECT_NAME)-php sh

fixhosts:
	docker cp scripts/update-hosts.sh $(COMPOSE_PROJECT_NAME)-php:/update-hosts.sh
	docker exec $(COMPOSE_PROJECT_NAME)-php sh /update-hosts.sh
	docker cp scripts/update-hosts.sh $(COMPOSE_PROJECT_NAME)-nginx:/update-hosts.sh

.PHONY: build shell
