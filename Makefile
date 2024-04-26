all:
	docker-compose -f ./srcs/docker-compose.yml up --build -d

down:
	docker-compose -f ./srcs/docker-compose.yml down

clean:
	make down
	docker rmi $$(docker images -q)
	docker volume rm $$(docker volume ls -q)

re:
	make down
	make all

.PHONY: all down clean re