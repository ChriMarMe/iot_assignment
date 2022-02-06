# Usage: make <command>
#
#
# Commands
#
#	help 			Shows this help
#	postgres-console	Connects to postgres docker instance with given user
#	create-db		Connects to postgres docker instance and creates the initial database
#	build			Composes docker image from docker-compose.yml and created database
#	docker-down		Stops all related docker containers
#	docker-up		Starts all realted docker containers
#	clean			Stops all containers and removes all unused docker data with force
#	clean-all		Like clean but also removes docker volumes

include .env

PSQL = PGPASSWORD=$(POSTGRES_PASSWORD) \
	docker exec -i $(POSTGRES_CONTAINER) \
	psql -h $(POSTGRES_HOST) -p 5432 -U $(POSTGRES_USER)


help:
	@head -13 Makefile

postgres-console:
	PGPASSWORD=$(POSTGRES_PASSWORD) \
	docker exec -it $(POSTGRES_CONTAINER) \
	psql -h $(POSTGRES_HOST) -p 5432 -U $(POSTGRES_USER) -d $(POSTGRES_DBNAME)

create-db:
	$(PSQL) -c "CREATE DATABASE $(POSTGRES_DBNAME)"
	cat createDBscheme.sql | $(PSQL) -d $(POSTGRES_DBNAME)

build:
	docker build ./ttn_soilmoister_collector -t syn4pt1k/ttn_collector
	docker build ./iot_rest_access -t syn4pt1k/iot_rest_access
	docker-compose up -d
	sleep 10s
	make create-db

docker-down:
	docker-compose down

docker-start:
	docker-compose up -d

clean:
	make docker-down
	docker system prune -af

clean-all:
	make clean
	docker volume prune
