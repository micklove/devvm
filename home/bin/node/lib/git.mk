
PROJECT_ROOT:=$(shell git rev-parse --show-toplevel)
GIT_BRANCH:=$(shell git rev-parse --abbrev-ref HEAD | sed "s*/*-*g")
GIT_COMMIT:=$(shell git rev-parse --short --verify HEAD)
GIT_COMMIT_LINK=$(shell git remote get-url origin | sed 's/.git$$//g')/commit/$(GIT_COMMIT)
GIT_COMMITER=$(shell git show -s --format='%ae' $(GIT_COMMIT))
