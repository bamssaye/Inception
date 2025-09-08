build:
	@docker compose -f srcs/docker-compose.yml build --no-cache
run:
	@docker compose -f srcs/docker-compose.yml run --rm nginx sh
up:
	@docker compose -f srcs/docker-compose.yml up -d
down:
	@docker compose -f srcs/docker-compose.yml down -v
stop:
	@docker compose -f srcs/docker-compose.yml stop
start:
	@docker compose -f srcs/docker-compose.yml start
volumes:
	@docker compose -f srcs/docker-compose.yml volumes
images:
	@docker compose -f srcs/docker-compose.yml images
logs:
	@docker logs wordpress  
logss:
	@docker logs mariadb
logee:
	@docker logs nginx
remove: down
	@docker compose -f srcs/docker-compose.yml down --rmi all
	@docker volume rm -f wordpress
	@docker volume rm -f mariadb
	
t: remove build up
# 	docker rmi $(docker images -a -q)

rm: remove
	@docker system prune --all --volumes -f

ls:
	@docker ps -a 
	@echo "-------------"
	@docker images -a 
	@echo "-------------"
	@docker volume ls 
	@echo "-------------"
	@docker network ls
lls:
	@docker compose -f srcs/docker-compose.yml ps 
	@echo "-------------"
	@docker compose -f srcs/docker-compose.yml images 
	@echo "-------------"
	@docker compose -f srcs/docker-compose.yml volumes
	@echo "-------------"
	@docker compose -f srcs/docker-compose.yml port 80