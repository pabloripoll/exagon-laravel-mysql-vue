# This Makefile requires GNU Make.
MAKEFLAGS += --silent

# Settings
C_BLU='\033[0;34m'
C_GRN='\033[0;32m'
C_RED='\033[0;31m'
C_YEL='\033[0;33m'
C_END='\033[0m'

include .env

CURRENT_USER=sudo
DOCKER=$(CURRENT_USER) docker
DOCKER_COMPOSE=$(CURRENT_USER) docker compose

help: ## Show this help message
	echo 'usage: make [target]'
	echo
	echo 'targets:'
	egrep '^(.+)\:\ ##\ (.+)' ${MAKEFILE_LIST} | column -t -c 2 -s ':#'

# Repository user
name := ""
email := ""
repo-user:  ## set local git repository user $ make repo-user name=pablo email=pabloripoll.it@gmail.com
	if [ $${name:-''} = "" -o $${email:-''} = "" ]; then \
		echo ${C_RED}"Repository user name must be specified!"${C_END}; \
    else \
		git config user.name "${name}"; \
		git config user.email "${email}"; \
		echo ${C_GRN}"O.K.! repository's user has been set."${C_END}; \
	fi

# -------------------------------------------------------------------------------------------------
#  System
# -------------------------------------------------------------------------------------------------
.PHONY: system-check

system-check:
	echo ${C_BLU}"DOCKER"${C_END}" requirements:";
	$(DOCKER) --version
	$(DOCKER_COMPOSE) version
	echo ""
	echo "Checking configuration for "${C_YEL}"Web"${C_END}" Application:";
	if [ -z "$$($(CURRENT_USER) lsof -i :$(WEBAPP_PORT))" ]; then \
		echo ${C_BLU}"WEBAPP"${C_END}" > port:"${C_GRN}"$(WEBAPP_PORT) is free to use."${C_END}; \
    else \
		echo ${C_BLU}"WEBAPP"${C_END}" > port:"${C_RED}"$(WEBAPP_PORT) is busy. Update ./.env file."${C_END}; \
	fi
	cd ./$(WEBAPP_DIR) && $(MAKE) docker-enviroment;
	echo ""
	echo "Checking configuration for "${C_YEL}"Web Service"${C_END}" Application:";
	if [ -z "$$($(CURRENT_USER) lsof -i :$(WEBAPP_SERVICE_PORT))" ]; then \
		echo ${C_BLU}"WEBAPP SERVICE"${C_END}" > port:"${C_GRN}"$(WEBAPP_SERVICE_PORT) is free to use."${C_END}; \
    else \
		echo ${C_BLU}"WEBAPP SERVICE"${C_END}" > port:"${C_RED}"$(WEBAPP_SERVICE_PORT) is busy. Update ./.env file."${C_END}; \
	fi
	cd ./$(WEBAPP_SERVICE_DIR) && $(MAKE) docker-enviroment;
	echo ""
	echo "Checking configuration for "${C_YEL}"Web Adminer"${C_END}" Application:";
	if [ -z "$$($(CURRENT_USER) lsof -i :$(WEBADM_PORT))" ]; then \
		echo ${C_BLU}"WEBADM"${C_END}" > port:"${C_GRN}"$(WEBADM_PORT) is free to use."${C_END}; \
    else \
		echo ${C_BLU}"WEBADM"${C_END}" > port:"${C_RED}"$(WEBADM_PORT) is busy. Update ./.env file."${C_END}; \
	fi
	cd ./$(WEBADM_DIR) && $(MAKE) docker-enviroment;
	echo ""
	echo "Checking configuration for "${C_YEL}"Web Adminer Service"${C_END}" Application:";
	if [ -z "$$($(CURRENT_USER) lsof -i :$(WEBADM_SERVICE_PORT))" ]; then \
		echo ${C_BLU}"WEBADM SERVICE"${C_END}" > port:"${C_GRN}"$(WEBADM_SERVICE_PORT) is free to use."${C_END}; \
    else \
		echo ${C_BLU}"WEBADM SERVICE"${C_END}" > port:"${C_RED}"$(WEBADM_SERVICE_PORT) is busy. Update ./.env file."${C_END}; \
	fi
	cd ./$(WEBADM_SERVICE_DIR) && $(MAKE) docker-enviroment;
	echo ""
	echo "Checking configuration for "${C_YEL}"MySQL Database"${C_END}":";
	if [ -z "$$($(CURRENT_USER) lsof -i :$(MARIADB_DB_PORT))" ]; then \
		echo ${C_BLU}"MYSQL DB"${C_END}" > port:"${C_GRN}"$(MARIADB_DB_PORT) is free to use."${C_END}; \
    else \
		echo ${C_BLU}"MYSQL DB"${C_END}" > port:"${C_RED}"$(MARIADB_DB_PORT) is busy. Update ./.env file."${C_END}; \
	fi
	cd ./$(MARIADB_DB_DIR) && $(MAKE) docker-enviroment;
	echo ""
# -------------------------------------------------------------------------------------------------
#  Docker
# -------------------------------------------------------------------------------------------------
.PHONY: images containers

images:
	$(DOCKER) images

containers:
	$(DOCKER) ps

# -------------------------------------------------------------------------------------------------
#  Webapp
# -------------------------------------------------------------------------------------------------
.PHONY: webapp webapp-set

webapp:
	cd ./$(WEBAPP_DIR) && $(MAKE) up dev;

webapp-set:
	cd ./$(WEBAPP_DIR) && $(MAKE) docker-enviroment-set;

webapp-service:
	cd ./$(WEBAPP_SERVICE_DIR) && $(MAKE) up dev;

webapp-service-set:
	cd ./$(WEBAPP_SERVICE_DIR) && $(MAKE) docker-enviroment-set;

# -------------------------------------------------------------------------------------------------
#  Web ADMIN
# -------------------------------------------------------------------------------------------------
.PHONY: webadm-service webadm-service-set

webadm:
	cd ./$(WEBADM_DIR) && $(MAKE) up dev;

webadm-set:
	cd ./$(WEBADM_DIR) && $(MAKE) docker-enviroment-set;

webadm-service:
	cd ./$(WEBADM_SERVICE_DIR) && $(MAKE) up;

webadm-service-set:
	cd ./$(WEBADM_SERVICE_DIR) && $(MAKE) docker-enviroment-set;

# -------------------------------------------------------------------------------------------------
#  MariaDB
# -------------------------------------------------------------------------------------------------
.PHONY: mariadb-service mariadb-service-set

mariadb-service:
	cd ./$(MARIADB_DIR) && $(MAKE) up;

mariadb-service-set:
	cd ./$(MARIADB_DIR) && $(MAKE) docker-enviroment-set;