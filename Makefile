build:
	@docker compose -f srcs/docker-compose.yml build --no-cache
up:
	@docker compose -f srcs/docker-compose.yml up -d
down:
	@docker compose -f srcs/docker-compose.yml down -v
volumes:
	@docker compose -f srcs/docker-compose.yml volumes
images:
	@docker compose -f srcs/docker-compose.yml images
network:
	docker inspect ince
continer:
	@docker compose -f srcs/docker-compose.yml ps
ps:
	@docker ps -a 
	@echo "-------------"
	@docker images -a 
	@echo "-------------"
	@docker volume ls 
	@echo "-------------"
	@docker network ls
remove:
	@docker system prune --all --volumes -f
