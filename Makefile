PHP_CONTAINER = e-commerce-symfony-ai-php
NODE_CONTAINER = e-commerce-symfony-ai-node
EXEC = docker exec -it -u www-data -w /var/www/app $(PHP_CONTAINER)
NODE_EXEC = docker exec -it $(NODE_CONTAINER)

composer:
	$(EXEC) composer $(CMD)

composer-install:
	$(EXEC) composer install

composer-require:
	$(EXEC) composer require $(PKG)

composer-require-dev:
	$(EXEC) composer require --dev $(PKG)

composer-update:
	$(EXEC) composer update --prefer-dist

console:
	$(EXEC) php bin/console $(CMD)

docker-down:
	docker compose down

docker-rebuild:
	docker compose stop
	docker compose build
	docker compose up -d --remove-orphans

docker-up:
	docker compose up -d

node-shell:
	$(NODE_EXEC) bash

php-shell:
	$(EXEC) bash

pnpm:
	$(NODE_EXEC) pnpm $(CMD)
