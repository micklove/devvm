SHELL=/bin/bash

export PROJECT_NAME ?= dummy
export PROJECT_LISTEN_PORT ?= 1971

SOURCE_FOLDER_NAME:=src
SOURCE_FOLDER_PATH:= $(PROJECT_NAME)/src
APP_MAIN_JS:=$(SOURCE_FOLDER_NAME)/server.js
APP_MAIN_JS_GENERATED_PATH:=$(PROJECT_NAME)/$(SOURCE_FOLDER_NAME)/server.js
GENERATED_README_PATH:=$(PROJECT_NAME)/README.md

CURRENT_USER:=$(shell whoami | sed "s/[^[:alpha:]]//g")
TIMESTAMP=$(shell date '+%Y-%m-%d-%H-%M-%S')

# TODO - put the github project link here
GENERATION_PROJECT:=ml-express-generator

-include ./lib/*.mk
.DEFAULT_GOAL := help

init: create-source-folders apply-templates create-ignore-files $(PROJECT_NAME)/lib $(PROJECT_NAME)/node_modules ## Create folders, git config, npm etc... for express based development

help::
	@echo Run  \"make init\" to start, ...
	@echo then \"make eslint-setup\" to configure eslint

# from various examples, e.g. https://blog.ragingflame.co.za/2015/4/1/how-i-build-nodejs-applications
.PHONY: create-source-folders
create-source-folders: ## Create source folder structure
	@mkdir -p $(SOURCE_FOLDER_PATH)
	@pushd $(SOURCE_FOLDER_PATH) > /dev/null && \
		mkdir -p scripts/ \
			middlewares/ \
			config/ \
			controllers/ \
			env/ \
			utils/ \
			models/ \
			routes/ \
			test/ && \
			popd > /dev/null

apply-templates: $(PROJECT_NAME)/Makefile $(APP_MAIN_JS_GENERATED_PATH) $(GENERATED_README_PATH)
	@cp -r templates/static/. $(PROJECT_NAME)/
	@cp -r templates/static_src/. $(SOURCE_FOLDER_PATH)/

$(PROJECT_NAME)/lib:
	@mkdir -p $@
	@cp -r lib/. $@/

.PHONY: git-setup
git-setup: create-source-folders ## Setup Git config
	echo "task: $@"
	@pushd $(PROJECT_NAME) > /dev/null && \
		git init && \
		popd > /dev/null

update-package-json:
	@echo "update package.json..."
	@echo "    use esm modules, type=module property"
	@echo "    set main property"
	@echo "    set directories.src property"
	cat $(PROJECT_NAME)/package.json

	jq '.type="module" | .main="$(APP_MAIN_JS)" | .directories.src="$(SOURCE_FOLDER_NAME)"'  \
		< $(PROJECT_NAME)/package.json \
		> $(PROJECT_NAME)/package.json.tmp
		mv $(PROJECT_NAME)/package.json.tmp $(PROJECT_NAME)/package.json

$(PROJECT_NAME)/package.json:
	@pushd $(PROJECT_NAME) > /dev/null && \
		npm init -y && \
		popd > /dev/null
		$(MAKE) --no-print-directory update-package-json

$(PROJECT_NAME)/node_modules: $(PROJECT_NAME)/package.json ## Setup npm project and dependencies
	@pushd $(PROJECT_NAME) > /dev/null && \
		npm ls --depth 0 && \
		npm i express \
			cors \
			express-basic-auth \
			helmet && \
		npm install --save-dev \
			eslint \
			eslint-config-airbnb-base \
			eslint-plugin-import \
			newman \
			jest \
			prettier && \
        popd > /dev/null
	@touch $@

eslint-setup: $(PROJECT_NAME)/node_modules ## Setup eslint config
	@pushd $(PROJECT_NAME) > /dev/null && \
		npx eslint --init && \
		popd > /dev/null

#create-ignore-files: $(PROJECT_NAME)/node_modules $(PROJECT_NAME)/.gitignore $(PROJECT_NAME)/.dockerignore $(PROJECT_NAME)/.eslintignore
create-ignore-files: $(PROJECT_NAME)/node_modules $(PROJECT_NAME)/.gitignore
	@ls -al $(PROJECT_NAME)/.*ignore

$(PROJECT_NAME)/.gitignore:
	@curl 'https://www.toptal.com/developers/gitignore/api/node' > $@

$(PROJECT_NAME)/Makefile: ## Generate project Makefile
	PROJECT_NAME=$(PROJECT_NAME) \
	PROJECT_LISTEN_PORT=$(PROJECT_LISTEN_PORT) \
	APP_MAIN_JS=$(APP_MAIN_JS) \
	envsubst '$${PROJECT_NAME} $${PROJECT_LISTEN_PORT} $${APP_MAIN_JS}' \
		< templates/dynamic/Makefile.envsubst \
		> $@.tmp && \
		mv $@.tmp $@

$(APP_MAIN_JS_GENERATED_PATH): ## Generate Express js
	PROJECT_NAME=$(PROJECT_NAME) \
	PROJECT_LISTEN_PORT=$(PROJECT_LISTEN_PORT) \
	envsubst '$${PROJECT_NAME} $${PROJECT_LISTEN_PORT}' \
		< templates/dynamic/server.envsubst.js \
		> $@.tmp && \
		mv $@.tmp $@

$(GENERATED_README_PATH): ## Generate README
	PROJECT_NAME=$(PROJECT_NAME) \
	PROJECT_LISTEN_PORT=$(PROJECT_LISTEN_PORT) \
	CURRENT_USER=$(CURRENT_USER) \
	GENERATION_PROJECT=$(GENERATION_PROJECT) \
	envsubst '$${PROJECT_NAME} $${PROJECT_LISTEN_PORT} $${CURRENT_USER} $${GENERATION_PROJECT} $${TIMESTAMP}' \
		< templates/dynamic/README.envsubst.md \
		> $@.tmp && \
		mv $@.tmp $@

dump:
	@find . -not -path "**git/**" -not -path "**node_modules/**"
	@echo "TIMESTAMP=$(TIMESTAMP)"

