build:
	@docker compose -f srcs/docker-compose.yml build
run:
	@docker compose -f srcs/docker-compose.yml run
up:
	@docker compose -f srcs/docker-compose.yml up -d
down:
	@docker compose -f srcs/docker-compose.yml down
stop:
	@docker compose -f srcs/docker-compose.yml stop
start:
	@docker compose -f srcs/docker-compose.yml start
volumes:
	@docker compose -f srcs/docker-compose.yml volumes
images:
	@docker compose -f srcs/docker-compose.yml images
remove: down
	@docker volume rm -f mariadb