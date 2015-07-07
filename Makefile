.PHONY: build

ifeq (build,$(firstword $(MAKECMDGOALS)))
  RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  $(eval $(RUN_ARGS):;@:)
endif

install:
	@echo "Verify no other virtual machines are booting. \n\n"
	vagrant up
	docker-compose -f compose/local.yml -p elixir up -d
build:
	docker-compose -f compose/local.yml -p elixir build
logs:
	docker-compose -f compose/local.yml -p elixir logs 
up:
	docker-compose -f compose/local.yml -p elixir up -d
rm:
	docker-compose -f compose/local.yml -p elixir kill && docker-compose -f compose/local.yml -p elixir rm -f
ps:
	docker-compose -f compose/local.yml -p elixir ps
restart:
	docker-compose -f compose/local.yml -p elixir kill && docker-compose -f compose/local.yml -p elixir rm -f && docker-compose -f compose/local.yml -p elixir up -d
recreate:
	docker-compose -f compose/local.yml -p elixir kill && docker-compose -f compose/local.yml -p elixir rm -f && docker-compose -f compose/local.yml -p elixir build && docker-compose -f compose/local.yml -p elixir up -d

ifeq (attach,$(firstword $(MAKECMDGOALS)))
  RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  $(eval $(RUN_ARGS):;@:)
endif

attach:
	docker exec -it elixir_$(RUN_ARGS)_1 /bin/bash
