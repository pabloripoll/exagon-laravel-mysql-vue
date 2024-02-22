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
.PHONY: hostname system-check

hostname:
	echo $(word 1,$(shell hostname -I))

system-check: ## shows this project ports on local machine availability
	echo ${C_BLU}"DOCKER requirements:"${C_END};
	$(DOCKER) --version
	$(DOCKER_COMPOSE) version
	echo "";
	cd ./$(WEBSHOP_DIR) && $(MAKE) host-check env;
	echo "";
	cd ./$(WEBSHOP_API_DIR) && $(MAKE) host-check env;
	echo "";
	cd ./$(WEBSHOP_DB_DIR) && $(MAKE) host-check env;
	echo "";
	cd ./$(WEBADMIN_DIR) && $(MAKE) host-check env;
	echo "";
	cd ./$(WEBADMIN_API_DIR) && $(MAKE) host-check env;
	echo "";
	cd ./$(WEBADMIN_DB_DIR) && $(MAKE) host-check env;
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
.PHONY: webshop-ssh webshop-env webshop-env-set webshop-create webshop-remove

webshop-ssh:
	cd ./$(WEBSHOP_DIR) && $(MAKE) ssh;

webshop-env:
	cd ./$(WEBSHOP_DIR) && $(MAKE) env;

webshop-env-set:
	cd ./$(WEBSHOP_DIR) && $(MAKE) env-set;

webshop-create:
	cd ./$(WEBSHOP_DIR) && $(MAKE) build up dev;

webshop-remove:
	cd ./$(WEBSHOP_DIR) && $(MAKE) stop clear;

# -------------------------------------------------------------------------------------------------
#  Webapp API
# -------------------------------------------------------------------------------------------------
.PHONY: webshop-api-ssh webshop-api-env webshop-api-env-set webshop-api-create webshop-api-remove

webshop-api-ssh:
	cd ./$(WEBSHOP_API_DIR) && $(MAKE) ssh;

webshop-api-env:
	cd ./$(WEBSHOP_API_DIR) && $(MAKE) env;

webshop-api-env-set:
	cd ./$(WEBSHOP_DIR) && $(MAKE) env-set;

webshop-api-create:
	cd ./$(WEBSHOP_API_DIR) && $(MAKE) build up dev;

webshop-api-remove:
	cd ./$(WEBSHOP_API_DIR) && $(MAKE) stop clear;

# -------------------------------------------------------------------------------------------------
#  Webapp DB
# -------------------------------------------------------------------------------------------------
.PHONY: webshop-db-ssh webshop-db-env webshop-db-create webshop-db-remove

webshop-db-ssh:
	cd ./$(WEBSHOP_DB_DIR) && $(MAKE) ssh;

webshop-db-env:
	cd ./$(WEBSHOP_DB_DIR) && $(MAKE) env;

webshop-db-env-set:
	cd ./$(WEBSHOP_DIR) && $(MAKE) env-set;

webshop-db-create:
	cd ./$(WEBSHOP_DB_DIR) && $(MAKE) build up;

webshop-db-remove:
	cd ./$(WEBSHOP_DB_DIR) && $(MAKE) stop clear;

# -------------------------------------------------------------------------------------------------
#  Backoffice
# -------------------------------------------------------------------------------------------------
.PHONY: webadmin-ssh webadmin-env webadmin-env-set webadmin-create webadmin-remove

webadmin-ssh:
	cd ./$(WEBADMIN_DIR) && $(MAKE) ssh;

webadmin-env:
	cd ./$(WEBADMIN_DIR) && $(MAKE) env;

webadmin-env-set:
	cd ./$(WEBADMIN_DIR) && $(MAKE) env-set;

webadmin-create:
	cd ./$(WEBADMIN_DIR) && $(MAKE) build up;

webadmin-remove:
	cd ./$(WEBADMIN_DIR) && $(MAKE) stop clear;

# -------------------------------------------------------------------------------------------------
#  Backoffice API
# -------------------------------------------------------------------------------------------------
.PHONY: webadmin-api-ssh webadmin-api-env webadmin-api-env-set webadmin-api-create webadmin-api-remove

webadmin-api-ssh:
	cd ./$(WEBADMIN_API_DIR) && $(MAKE) ssh;

webadmin-api-env:
	cd ./$(WEBADMIN_API_DIR) && $(MAKE) env;

webadmin-api-env-set:
	cd ./$(WEBADMIN_API_DIR) && $(MAKE) env-set;

webadmin-api-create:
	cd ./$(WEBADMIN_API_DIR) && $(MAKE) build up;

webadmin-api-remove:
	cd ./$(WEBADMIN_API_DIR) && $(MAKE) stop clear;

# -------------------------------------------------------------------------------------------------
# Backoffice DB
# -------------------------------------------------------------------------------------------------
.PHONY: webadmin-db-ssh webadmin-db-env webadmin-db-env-set webadmin-db-create webadmin-db-remove

webadmin-db-ssh:
	cd ./$(WEBADMIN_DB_DIR) && $(MAKE) ssh;

webadmin-db-env:
	cd ./$(WEBADMIN_DB_DIR) && $(MAKE) env;

webadmin-db-env-set:
	cd ./$(WEBADMIN_DB_DIR) && $(MAKE) env-set;

webadmin-db-create:
	cd ./$(WEBADMIN_DB_DIR) && $(MAKE) build up;

webadmin-db-remove:
	cd ./$(WEBADMIN_DB_DIR) && $(MAKE) stop clear;

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
.PHONY: eshop-set eshop-create eshop-remove admin-set admin-create admin-remove

eshop-set:
	$(MAKE) webshop-db-env-set webshop-api-env-set webshop-env-set;

eshop-create:
	echo "eshop-create not available";

eshop-remove:
	echo "eshop-remove not available";

admin-set:
	$(MAKE) bucket-env-set webadmin-db-env-set webadmin-api-env-set webadmin-env-set;

admin-create:
	$(MAKE) bucket-create webadmin-db-create;

admin-remove:
	$(MAKE) bucket-remove webadmin-db-remove webadmin-api-remove webadmin-remove;

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