#----
# Config
#----

ifneq (,$(wildcard .env))
	include .env
	export
	ENV_FILE_PARAM := --env-file .env
endif

#----
# Variables
#----

PROJECT_NAME := flowise
COMPOSE_PROJECT_NAME := --project-name $(PROJECT_NAME)

#----
# Docker Compose
#----

start: ## start flowise project
	docker-compose $(COMPOSE_PROJECT_NAME) up --build
.PHONY: start

#----
# Others
#----

.DEFAULT_GOAL := help

help:
	@awk -F ':|##' '/^[^\t].+:.*##/ { printf "\033[36mmake %-28s\033[0m -%s\n", $$1, $$NF }' $(MAKEFILE_LIST) | sort
.PHONY: help
