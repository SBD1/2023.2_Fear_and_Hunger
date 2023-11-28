build:
		docker-compose -f game/Backend/docker-compose.yml up -d
		cd game/Backend && npm run dev

stop:
	docker-compose -f game/Backend/docker-compose.yml stop

prune:
	docker system prune && docker volume prune