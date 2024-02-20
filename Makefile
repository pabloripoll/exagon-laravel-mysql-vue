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

help: ## shows this Makefile help message
	echo 'usage: make [target]'
	echo
	echo 'targets:'
	egrep '^(.+)\:\ ##\ (.+)' ${MAKEFILE_LIST} | column -t -c 2 -s ':#'

# -------------------------------------------------------------------------------------------------
#  System
# -------------------------------------------------------------------------------------------------
.PHONY: system-check

system-check: ## shows this project ports on local machine availability
	echo ${C_BLU}"DOCKER requirements:"${C_END};
	$(DOCKER) --version
	$(DOCKER_COMPOSE) version
	echo "";
	cd ./$(WEBAPP_DIR) && $(MAKE) host-check env;
	echo "";
	cd ./$(WEBAPP_API_DIR) && $(MAKE) host-check env;
	echo "";
	cd ./$(WEBAPP_DB_DIR) && $(MAKE) host-check env;
	echo "";
	cd ./$(WEBADM_DIR) && $(MAKE) host-check env;
	echo "";
	cd ./$(WEBADM_API_DIR) && $(MAKE) host-check env;
	echo "";
	cd ./$(WEBADM_DB_DIR) && $(MAKE) host-check env;
	echo "";
	cd ./$(BUCKET_DIR) && $(MAKE) host-check env;
	echo "";

# -------------------------------------------------------------------------------------------------
#  Docker
# -------------------------------------------------------------------------------------------------
.PHONY: images containers

images:
	echo ${C_BLU}"DOCKER IMAGES"${C_END};
	$(DOCKER) images
	echo ${C_YEL}"Remove any image if container is down by $$ $(DOCKER) image rm -f {IMAGE ID}"${C_END};

containers:
	echo ${C_BLU}"DOCKER CONTAINERS"${C_END};
	$(DOCKER) ps -a

# -------------------------------------------------------------------------------------------------
#  Webapp
# -------------------------------------------------------------------------------------------------
.PHONY: webapp-ssh webapp-env webapp-env-set webapp-create webapp-remove

webapp-ssh:
	cd ./$(WEBAPP_DIR) && $(MAKE) ssh;

webapp-env:
	cd ./$(WEBAPP_DIR) && $(MAKE) env;

webapp-env-set:
	cd ./$(WEBAPP_DIR) && $(MAKE) env-set;

webapp-create:
	cd ./$(WEBAPP_DIR) && $(MAKE) build up dev;

webapp-remove:
	cd ./$(WEBAPP_DIR) && $(MAKE) stop clear;

# -------------------------------------------------------------------------------------------------
#  Webapp API
# -------------------------------------------------------------------------------------------------
.PHONY: webapp-api-ssh webapp-api-env webapp-api-env-set webapp-api-create webapp-api-remove

webapp-api-ssh:
	cd ./$(WEBAPP_API_DIR) && $(MAKE) ssh;

webapp-api-env:
	cd ./$(WEBAPP_API_DIR) && $(MAKE) env;

webapp-api-env-set:
	cd ./$(WEBAPP_DIR) && $(MAKE) env-set;

webapp-api-create:
	cd ./$(WEBAPP_API_DIR) && $(MAKE) build up dev;

webapp-api-remove:
	cd ./$(WEBAPP_API_DIR) && $(MAKE) stop clear;

# -------------------------------------------------------------------------------------------------
#  Webapp DB
# -------------------------------------------------------------------------------------------------
.PHONY: webapp-db-ssh webapp-db-env webapp-db-create webapp-db-remove

webapp-db-ssh:
	cd ./$(WEBAPP_DB_DIR) && $(MAKE) ssh;

webapp-db-env:
	cd ./$(WEBAPP_DB_DIR) && $(MAKE) env;

webapp-db-env-set:
	cd ./$(WEBAPP_DIR) && $(MAKE) env-set;

webapp-db-create:
	cd ./$(WEBAPP_DB_DIR) && $(MAKE) build up;

webapp-db-remove:
	cd ./$(WEBAPP_DB_DIR) && $(MAKE) stop clear;

# -------------------------------------------------------------------------------------------------
#  Backoffice
# -------------------------------------------------------------------------------------------------
.PHONY: webadm-ssh webadm-env webadm-env-set webadm-create webadm-remove

webadm-ssh:
	cd ./$(WEBADM_DIR) && $(MAKE) ssh;

webadm-env:
	cd ./$(WEBADM_DIR) && $(MAKE) env;

webadm-env-set:
	cd ./$(WEBADM_DIR) && $(MAKE) env-set;

webadm-create:
	cd ./$(WEBADM_DIR) && $(MAKE) build up;

webadm-remove:
	cd ./$(WEBADM_DIR) && $(MAKE) stop clear;

# -------------------------------------------------------------------------------------------------
#  Backoffice API
# -------------------------------------------------------------------------------------------------
.PHONY: webadm-api-ssh webadm-api-env webadm-api-env-set webadm-api-create webadm-api-remove

webadm-api-ssh:
	cd ./$(WEBADM_API_DIR) && $(MAKE) ssh;

webadm-api-env:
	cd ./$(WEBADM_API_DIR) && $(MAKE) env;

webadm-api-env-set:
	cd ./$(WEBADM_API_DIR) && $(MAKE) env-set;

webadm-api-create:
	cd ./$(WEBADM_API_DIR) && $(MAKE) build up;

webadm-api-remove:
	cd ./$(WEBADM_API_DIR) && $(MAKE) stop clear;

# -------------------------------------------------------------------------------------------------
# Backoffice DB
# -------------------------------------------------------------------------------------------------
.PHONY: webadm-db-ssh webadm-db-env webadm-db-env-set webadm-db-create webadm-db-remove

webadm-db-ssh:
	cd ./$(WEBADM_DB_DIR) && $(MAKE) ssh;

webadm-db-env:
	cd ./$(WEBADM_DB_DIR) && $(MAKE) env;

webadm-db-env-set:
	cd ./$(WEBADM_DB_DIR) && $(MAKE) env-set;

webadm-db-create:
	cd ./$(WEBADM_DB_DIR) && $(MAKE) build up;

webadm-db-remove:
	cd ./$(WEBADM_DB_DIR) && $(MAKE) stop clear;

# -------------------------------------------------------------------------------------------------
#  Bucket
# -------------------------------------------------------------------------------------------------
.PHONY: bucket-ssh bucket-env bucket-env-set bucket-create bucket-remove

bucket-ssh:
	cd ./$(BUCKET_DIR) && $(MAKE) ssh;

bucket-env:
	cd ./$(BUCKET_DIR) && $(MAKE) env;

bucket-env-set:
	cd ./$(BUCKET_DIR) && $(MAKE) env-set;

bucket-create:
	cd ./$(BUCKET_DIR) && $(MAKE) build up;

bucket-remove:
	cd ./$(BUCKET_DIR) && $(MAKE) stop clear;

# -------------------------------------------------------------------------------------------------
#  PROJECT
# -------------------------------------------------------------------------------------------------
.PHONY: backoffice-create backoffice-remove

backoffice-create:
	bucket-env-set webadm-env-set webadm-db-env-set webadm-api-env-set

backoffice-remove:
	cd ./$(WEBADM_DIR) && $(MAKE) stop clear;

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