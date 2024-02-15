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

webapp-env:
	cd ./$(WEBAPP_DIR) && $(MAKE) docker-enviroment-set;

webapp-build:
	cd ./$(WEBAPP_DIR) && $(MAKE) up dev;

# -------------------------------------------------------------------------------------------------
#  Web ADMIN
# -------------------------------------------------------------------------------------------------
.PHONY: webadm-service webadm-service-set

webadm-env:
	cd ./$(WEBADM_DIR) && $(MAKE) docker-enviroment-set;

webadm-build:
	cd ./$(WEBADM_DIR) && $(MAKE) up dev;

webadm-service:
	cd ./$(WEBADM_SERVICE_DIR) && $(MAKE) up;

webadm-service-set:
	cd ./$(WEBADM_SERVICE_DIR) && $(MAKE) docker-enviroment-set;

# -------------------------------------------------------------------------------------------------
#  MariaDB
# -------------------------------------------------------------------------------------------------
.PHONY: mariadb-service mariadb-service-set

mariadb-build:
	cd ./$(MARIADB_DIR) && $(MAKE) up;

mariadb-service-set:
	cd ./$(MARIADB_DIR) && $(MAKE) docker-enviroment-set;

# -------------------------------------------------------------------------------------------------
#  Repository
# -------------------------------------------------------------------------------------------------
.PHONY: repo-test repo-user repo-flush repo-preset repo-push repo-pull

repo-test: ## compares remote git repository connection with current set in .git/config
	echo ${C_BLU}Repository config connection:${C_END};
	git remote -v
	echo ${C_YEL}Repository connection check:${C_END};
	git ls-remote $(REPO_CONN)

name := ""
email := ""
repo-user: ## set local git repository user
	if [ $${name:-''} = "" -o $${email:-''} = "" ]; then \
		echo ${C_RED}"Repository user name must be specified!"${C_END}; \
    else \
		git config user.name "${name}"; \
		git config user.email "${email}"; \
		echo ${C_GRN}"O.K.! repository's user has been set."${C_END}; \
	fi

repo-flush: ## clears local git repository cache
	git rm -rf --cached .;
	git add .;
	git commit -m "fix: cache cleared for untracked files";

# Default branch and comment variables with most common values
branch ?= "$(shell git branch | sed 's/^.\{2\}//')"
comment ?= maint: $(shell date +"%Y.%m.%d %H:%M:%S")

repo-preset: # push and pull helper
	@echo "Repository preset "${C_YEL}"PUSH TO REPOSITORY"${C_END}" process:"
	@echo "$$ git stash \n\$$ git pull origin -u "${C_GRN}$(branch)${C_END}" \n\$$ git stash pop \n\
	$$ git add .  \n\$$ git commit -m \"$(comment)\"  \n\$$ git push origin -u "${C_GRN}$(branch)${C_END}
	@echo "Repository preset "${C_YEL}"PULL FROM REPOSITORY"${C_END}" process:"
	@echo "$$ git stash \n\$$ git pull origin -u "${C_GRN}$(branch)${C_END}" \n\$$ git stash pop"

repo-push: ## git push equivalent on current branch or by specified branch or comment $ make repo-update branch=??? comment="???"
	@echo ${C_YEL}"ATTENTION:"${C_END}
	@echo "All local changes from branch:"
	git branch;
	@echo "Is going to be pushed into * "${C_YEL}"$(branch)"${C_END}" branch,"
	@echo "On repository" ${C_YEL}$(shell git config --get remote.origin.url)${C_END}
	@echo "with the following commit comment:"
	@echo "*" ${C_GRN}${comment}${C_END};
	@echo -n ${C_YEL}"Are you sure? "${C_END}"[Y/n]: " && read response && if [ $${response:-'n'} != 'Y' ]; then \
        echo ${C_RED}"K.O.! update process has been stopped."${C_END}; \
    else \
		git stash; \
		git pull origin $(branch); \
		git stash pop; \
		git add .; \
		git commit -m "$(comment)"; \
		git push origin -u $(branch); \
        echo ${C_GRN}"O.K.! remote repository's branch has been updated from local."${C_END}; \
    fi

repo-pull: ## git pull equivalent on current branch.
	@echo ${C_YEL}"ATTENTION:"${C_END}
	@echo "Changes from remote branch:"
	git branch;
	@echo "Is going to be pulled into * "${C_YEL}"$(branch)"${C_END}" branch,"
	@echo "On repository" ${C_YEL}$(shell git config --get remote.origin.url)${C_END}
	@echo -n ${C_YEL}"Are you sure? "${C_END}"[Y/n]: " && read response && if [ $${response:-'n'} != 'Y' ]; then \
        echo ${C_RED}"K.O.! update process has been stopped."${C_END}; \
    else \
		git stash; \
		git pull origin $(branch); \
		git stash pop; \
        echo ${C_GRN}"O.K.! local repository's branch has been updated from remote."${C_END}; \
		git push origin -u master; \
        echo ${C_GRN}"O.K.! remote repository has been updated from local."${C_END}; \
    fi