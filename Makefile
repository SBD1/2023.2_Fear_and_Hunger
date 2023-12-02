build:
		docker-compose -f game/docker-compose.yml up -d	
stop:
		docker-compose -f game/docker-compose.yml stop
down:
		docker-compose -f game/docker-compose.yml down
start:
		docker-compose -f game/docker-compose.yml start
restart:
		docker-compose -f game/docker-compose.yml stop
		docker-compose -f game/docker-compose.yml up -d	
prune:
		docker system prune && docker volume prune
clean:
		docker-compose -f game/docker-compose.yml stop
		docker system prune -a --volumes