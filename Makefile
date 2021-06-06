# Makefile for Docker 
# thanks to https://gist.github.com/mpneuried/0594963ad38e68917ef189b4e6a269db
# import config.
# You can change the default config with `make cnf="config_special.env" build`
cnf ?= config.env
include $(cnf)
export $(shell sed 's/=.*//' $(cnf))

# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help


# DOCKER TASKS
# Build the container
build: ## Build the container
	docker build --build-arg SSH_PUBKEY="$$(cat ~/.ssh/id_rsa.pub)" -t $(APP_NAME) .

build-nc: ## Build the container without caching
	docker build --no-cache --build-arg SSH_PUBKEY="$$(cat ~/.ssh/id_rsa.pub)" -t $(APP_NAME) .

run: ## Run container on port configured in `config.env`
	docker run -d --rm --env-file=./config.env -p=$(PORT):22 --name="$(APP_NAME)" $(APP_NAME)


up: build run ## Build & Run container on port configured in `config.env`

stop: ## Stop a running container
	docker stop $(APP_NAME)
