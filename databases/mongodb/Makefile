# This Makefile requires GNU Make.
MAKEFLAGS += --silent

# Settings
C_BLU='\033[0;34m'
C_GRN='\033[0;32m'
C_RED='\033[0;31m'
C_YEL='\033[0;33m'
C_END='\033[0m'

include ../../.env

DOCKER_NAME=$(PROJECT)$(MARIADB_DB_PROJECT)
CURRENT_DIR=$(patsubst %/,%,$(dir $(realpath $(firstword $(MAKEFILE_LIST)))))
DIR_BASENAME=$(shell basename $(CURRENT_DIR))
ROOT_DIR=$(CURRENT_DIR)
PROJECT_DIR=src
CURRENT_USER=sudo
DOCKER_COMPOSE?=$(CURRENT_USER) docker compose
DOCKER_COMPOSE_RUN=$(DOCKER_COMPOSE) run --rm
DOCKER_EXEC_TOOLS_APP=$(CURRENT_USER) docker exec -it $(DOCKER_NAME) sh

#
# Helpers
#
.PHONY: fix-permission docker-enviroment docker-enviroment-set

fix-permission:
	$(CURRENT_USER) chown -R ${USER}: $(ROOT_DIR)/

docker-enviroment:
	if [ -f ./.env ]; then \
		echo ${C_BLU}"MARIADB ENV"${C_END}" file "${C_GRN}"is set."${C_END}; \
    else \
		echo ${C_BLU}"MARIADB ENV"${C_END}${C_YEL}" is not set."${C_END}"\
	Create one placed in ./ by "${C_YEL}"$$ make mariadb-docker-env"${C_END}" \
	or in ./$(MARIADB_DB_DIR)/ by "${C_YEL}"$$ make docker-enviroment-set"${C_END}; \
	fi

docker-enviroment-set:
	echo "PROJECT=$(PROJECT)$(MARIADB_DB_PROJECT)\
	\nPROJECT_PORT=$(MARIADB_DB_PORT)\
	\nMYSQL_ROOT_PASSWORD=\"$(MARIADB_DB_ROOT)\"\
	\nMYSQL_DATABASE=$(MARIADB_DB_NAME)\
	\nMYSQL_USER=$(MARIADB_DB_USER)\
	\nMYSQL_PASSWORD=\"$(MARIADB_DB_PASS)\""> ./.env;
	echo $(C_BLU)"MARIADB ENV"$(C_END)" file "$(C_GRN)"has been set."$(C_END);

#
# Enter container
#
.PHONY: ssh

ssh:
	$(DOCKER_EXEC_TOOLS_APP)

#
# Commands
#
.PHONY: build up start first stop restart clear

build:
	$(DOCKER_COMPOSE) up --build --no-recreate -d

up:
	$(DOCKER_COMPOSE) up -d

start:
	up

stop:
	$(DOCKER_COMPOSE) kill || true
	$(DOCKER_COMPOSE) rm --force || true

restart:
	stop start

clear:
	$(DOCKER_COMPOSE) down -v --remove-orphans || true

rebuild:
	stop clear build start