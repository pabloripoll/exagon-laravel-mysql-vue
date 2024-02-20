# This Makefile requires GNU Make.
MAKEFLAGS += --silent

# Settings
C_BLU='\033[0;34m'
C_GRN='\033[0;32m'
C_RED='\033[0;31m'
C_YEL='\033[0;33m'
C_END='\033[0m'

include ../.env

DOCKER_PORT=$(WEBAPP_SERVICE_PORT)
DOCKER_NAME=$(PROJECT)$(WEBAPP_SERVICE_PROJECT)$(PROJECT_CODE)
CURRENT_DIR=$(patsubst %/,%,$(dir $(realpath $(firstword $(MAKEFILE_LIST)))))
DIR_BASENAME=$(shell basename $(CURRENT_DIR))
ROOT_DIR=$(CURRENT_DIR)
PROJECT_DIR=src
CURRENT_USER=sudo
DOCKER_COMPOSE?=$(CURRENT_USER) docker compose
DOCKER_COMPOSE_RUN=$(DOCKER_COMPOSE) run --rm
DOCKER_EXEC_TOOLS_APP=$(CURRENT_USER) docker exec -it $(DOCKER_NAME) sh
NODE_INSTALL="npm i"
SERVER_RUN="npm run dev"

help: ## shows this Makefile help message
	echo 'usage: make [target]'
	echo
	echo 'targets:'
	egrep '^(.+)\:\ ##\ (.+)' ${MAKEFILE_LIST} | column -t -c 2 -s ':#'

# -------------------------------------------------------------------------------------------------
#  System
# -------------------------------------------------------------------------------------------------
.PHONY: fix-permission

fix-permission: ## sets project directory permission
	$(CURRENT_USER) chown -R ${USER}: $(ROOT_DIR)/

system-check: ## shows this project ports availability on local machine
	echo "Checking configuration for "${C_YEL}"$(DOCKER_NAME)"${C_END}" App Container:";
	if [ -z "$$($(CURRENT_USER) lsof -i :$(DOCKER_PORT))" ]; then \
		echo ${C_BLU}"WEBAPP_SERVICE"${C_END}" > port:"${C_GRN}"$(DOCKER_PORT) is free to use."${C_END}; \
    else \
		echo ${C_BLU}"WEBAPP_SERVICE"${C_END}" > port:"${C_RED}"$(DOCKER_PORT) is busy. Update ./.env file."${C_END}; \
	fi

# -------------------------------------------------------------------------------------------------
#  Docker
# -------------------------------------------------------------------------------------------------
.PHONY: env env-set

env: ## checks if docker .env file exists
	if [ -f ./docker/.env ]; then \
		echo ${C_BLU}"WEBAPP_SERVICE DOCKER ENV"${C_END}" file "${C_GRN}"is set."${C_END}; \
    else \
		echo ${C_BLU}"WEBAPP_SERVICE DOCKER ENV"${C_END}${C_YEL}" is not set."${C_END}" \
	Create one placed in ./ by "${C_YEL}"$$ make webapp-env"${C_END}" \
	or in ./$(DIR_BASENAME)/ by "${C_YEL}"$$ make env-set"${C_END}; \
	fi

env-set: ## sets docker .env file
	echo "PROJECT=$(DOCKER_NAME)\
	\nPROJECT_PORT=$(DOCKER_PORT)" > ./docker/.env;
	echo ${C_BLU}"WEBAPP_SERVICE DOCKER ENV"${C_END}" file "${C_GRN}"has been set."${C_END};

#
# Commands
#
.PHONY: ssh build install dev up start first stop restart clear

ssh:
	$(DOCKER_EXEC_TOOLS_APP)

build:
	cd docker && $(DOCKER_COMPOSE) up --build --no-recreate -d

install:
	cd docker && $(DOCKER_EXEC_TOOLS_APP) -c $(NODE_INSTALL)

dev:
	cd docker && $(DOCKER_EXEC_TOOLS_APP) -c $(SERVER_RUN)

up:
	cd docker && $(DOCKER_COMPOSE) up -d
	$(CURRENT_USER) docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(DOCKER_NAME)
	echo $(DOCKER_PORT)

container-ip:
	$(CURRENT_USER) docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(DOCKER_NAME)
	echo $(DOCKER_PORT)

start:
	up dev

first:
	build install dev

stop:
	cd docker && $(DOCKER_COMPOSE) kill || true
	cd docker && $(DOCKER_COMPOSE) rm --force || true

restart:
	stop start dev

clear:
	cd docker && $(DOCKER_COMPOSE) down -v --remove-orphans || true

## Legacy
#server:
#	go run cmd/main.go

#build:
#	go build -o bin/server cmd/main.go

#d.up:
#	sudo docker compose up

#d.down:
#	sudo docker compose down

#d.up.build:
#	sudo docker compose --build up