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
ftp:
	@docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ftp-server
ps:
	@docker compose -f srcs/docker-compose.yml ps 
	@echo "-------------"
	@docker compose -f srcs/docker-compose.yml images 
	@echo "-------------"
	@docker compose -f srcs/docker-compose.yml volumes
	@echo "-------------"
	@docker network ls








# run:
# 	@docker compose -f srcs/docker-compose.yml run --rm nginx sh


# stop:
# 	@docker compose -f srcs/docker-compose.yml stop
# start:
# 	@docker compose -f srcs/docker-compose.yml start



# logs:
# 	@docker logs wordpress  
# logss:
# 	@docker logs mariadb
# logee:
# 	@docker logs nginx
remove: down
	@docker compose -f srcs/docker-compose.yml down --rmi all
	@docker volume rm -f wordpress
	@docker volume rm -f mariadb
	
# t: remove build up
# # 	docker rmi $(docker images -a -q)

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