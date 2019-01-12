build:
	docker-compose down
	docker-compose build --no-cache
	docker-compose up -d

start:
	docker-compose up -d

stop:
	docker-compose down

restart:
	docker-compose down --remove-orphans
	docker-compose up -d

shell:
	docker exec -it starterstack_nginx sh

.PHONY: build shell
