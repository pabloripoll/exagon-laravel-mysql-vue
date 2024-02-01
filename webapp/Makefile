# This Makefile requires GNU Make.
MAKEFLAGS += --silent

# Settings
C_BLU='\033[0;34m'
C_GRN='\033[0;32m'
C_RED='\033[0;31m'
C_YEL='\033[0;33m'
C_END='\033[0m'

include ../.env

DOCKER_NAME=$(PROJECT)
CURRENT_DIR=$(patsubst %/,%,$(dir $(realpath $(firstword $(MAKEFILE_LIST)))))
DIR_BASENAME=$(shell basename $(CURRENT_DIR))
ROOT_DIR=$(CURRENT_DIR)
PROJECT_DIR=src
CURRENT_USER=sudo
DOCKER_COMPOSE?=$(CURRENT_USER) docker compose
DOCKER_COMPOSE_RUN=$(DOCKER_COMPOSE) run --rm
DOCKER_EXEC_TOOLS_APP=$(CURRENT_USER) docker exec -it $(PROJECT)$(WEBAPP_PROJECT) sh
NODE_INSTALL="npm i"
SERVER_RUN="npm run dev"

#
# Helpers
#
.PHONY: fix-permission docker-enviroment docker-enviroment-set

fix-permission:
	$(CURRENT_USER) chown -R ${USER}: $(ROOT_DIR)/

docker-enviroment:
	if [ -f ./docker/.env ]; then \
		echo ${C_BLU}"WEBAPP DOCKER ENV"${C_END}" file "${C_GRN}"is set."${C_END}; \
    else \
		echo ${C_BLU}"WEBAPP DOCKER ENV"${C_END}${C_YEL}" is not set."${C_END}"\
	Create one placed in ./ by "${C_YEL}"$$ make webapp-docker-env"${C_END}" \
	or in ./$(DIR_BASENAME)/ by "${C_YEL}"$$ make docker-enviroment-set"${C_END}; \
	fi

docker-enviroment-set:
	echo "PROJECT=${PROJECT}${WEBAPP_PROJECT}\
	\nPROJECT_PORT=${WEBAPP_PORT}" > ./docker/.env;
	echo ${C_BLU}"WEBAPP DOCKER ENV"${C_END}" file "${C_GRN}"has been set."${C_END};

#
# Enter container
#
.PHONY: ssh

ssh:
	$(DOCKER_EXEC_TOOLS_APP)

#
# Commands
#
.PHONY: build install dev up start first stop restart clear

build:
	cd docker && $(DOCKER_COMPOSE) up --build --no-recreate -d

install:
	cd docker && $(DOCKER_EXEC_TOOLS_APP) -c $(NODE_INSTALL)

dev:
	cd docker && $(DOCKER_EXEC_TOOLS_APP) -c $(SERVER_RUN)

up:
	cd docker && $(DOCKER_COMPOSE) up -d

start:
	up dev

first:
	build install dev

stop: ## ${PROJECT}${WEBAPP_PROJECT}
	cd docker && $(DOCKER_COMPOSE) kill || true
	cd docker && $(DOCKER_COMPOSE) rm --force || true

restart:
	stop start dev

clear: ## stop $(ROOT_DIR)/docker-compose.yml
	cd docker && $(DOCKER_COMPOSE) down -v --remove-orphans || true
