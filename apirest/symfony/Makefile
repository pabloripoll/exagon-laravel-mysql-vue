## MySQL DATABASE
mysql-start: ## Build / Start MySQL container
	cd ./docker/mysql; docker-compose --env-file ./.env up -d

mysql-stop: ## Stop MySQL container
	docker stop ${PROJECT}-mysql

mysql-remove: ## Remove MySQL container
	docker rm ${PROJECT}-mysql

mysql-ssh-root: ## Enter into MySQL container as root - remember to change password here if it changes on /docker/mariadb/.env
	docker exec -it ${PROJECT}-mysql mysql --user root -p${MYSQL_ROOT_PASSWORD};

mysql-ssh: ## Enter into MySQL container - remember to change password here if it changes on /docker/mariadb/.env
	docker exec -it ${PROJECT}-mysql mysql --user ${MYSQL_USER} -p${MYSQL_PASSWORD};

## MySQL PhpMyAdmin
mysql-admin-start: ## Build / Start phpMyAdmin for MySQL container
	cd ./docker/mysql/phpmyadmin; docker-compose up -d

mysql-admin-stop: ## Stop phpMyAdmin for MySQL container
	docker stop ${PROJECT}-mysql-admin

mysql-admin-remove: ## Remove phpMyAdmin for MySQL container
	docker rm ${PROJECT}-mysql-admin

## MariaDB DATABASE
mariadb-start: ## Build / Start MariaDB container
	docker-compose -f compose-mariadb.yml up

mariadb-stop: ## Stop MariaDB container
	docker stop ${PROJECT}-mariadb

mariadb-remove: ## Remove MariaDb container
	docker rm ${PROJECT}-mariadb

##
mariadb-ssh-root: ## Enter into MariaDb container as root - remember to change password here if it changes on /docker/mariadb/.env
	docker exec -it ${PROJECT}-mariadb mariadb --user root -p${MYSQL_ROOT_PASSWORD};

mariadb-ssh: ## Enter into MariaDb container - remember to change password here if it changes on /docker/mariadb/.env
	docker exec -it ${PROJECT}-mariadb mariadb --user ${MYSQL_USER} -p${MYSQL_PASSWORD};

## MariaDB PhpMyAdmin
mariadb-admin-start: ## Build / Start phpMyAdmin for MariaDB container
	cd ./docker/mariadb/phpmyadmin; docker-compose up -d

mariadb-admin-stop: ## Stop phpMyAdmin for MariaDB container
	docker stop ${PROJECT}-mariadb-admin

mariadb-admin-remove: ## Remove phpMyAdmin for MariaDB container
	docker rm ${PROJECT}-mariadb-admin

## Symfony SERVER as Service1
symfony-start: ## Build / Start Nginx & PHP containers for Service 1
	cd ./docker/symfony; docker-compose up -d

symfony-stop: ## Stop Nginx & PHP containers for Service 1
	docker stop ${PROJECT}-service1

symfony-remove: ## Remove Nginx & PHP containers for Service 1
	docker rm ${PROJECT}-service1

symfony-build: ## Build Symfony API for Service 1 just once
	cd ./docker/symfony; docker-compose exec ${PROJECT}-service1-api composer install