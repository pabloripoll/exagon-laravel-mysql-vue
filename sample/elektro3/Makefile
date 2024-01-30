MAKEFLAGS += --silent

DOCKER_PHP = erp-php
DOCKER_DB = erp-db
USER_ID = $(shell id -u)
GROUP_ID = $(shell id -g)

help: ## Show this help message
	echo 'usage: make [target]'
	echo
	echo 'targets:'
	egrep '^(.+)\:\ ##\ (.+)' ${MAKEFILE_LIST} | column -t -c 2 -s ':#'

run: ## Start the containers
	USER_ID=${USER_ID} GROUP_ID=${GROUP_ID} docker-compose up -d

stop: ## Stop the containers
	docker-compose stop

down: ## Remove the containers
	docker-compose down

restart: ## Restart the containers
	$(MAKE) stop && $(MAKE) run

ps: ## Information about the containers
	docker-compose ps

ssh-php: ## ssh into the php container
	docker exec -it ${DOCKER_PHP} bash

ssh-php-root: ## ssh into the php container as root user
	docker exec -it -u root ${DOCKER_PHP} bash

ssh-db-root: ## ssh into the db container as root user
	docker exec -it -u root ${DOCKER_DB} bash

composer-install: ## Execute composer install into the php container
	docker exec -it ${DOCKER_PHP} composer install

generate-key: ## Generate Laravel key
	docker exec -it ${DOCKER_PHP} php artisan key:generate

deploy: ## Deploys the code to the HEAD commit of the master branch on the server to erp.elektro3.com
	ssh erp@erp.elektro3.com -p 2222 -t /var/www/vhosts/erp/bin/deploy
