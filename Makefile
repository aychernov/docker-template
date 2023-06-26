mongo:
	docker run -p 27017:27017 \
		-d \
		--rm --name mongodb \
		--network notes-net \
		--env-file ./config/development.env \
		-v mongo-data:/data/db \
		mongo

backend:
	docker run -p 5000:5000 \
		-d \
		--rm \
		--name notes-backend \
		--network notes-net \
		-v D:\SHAREWOOD\docker-practicum-vladilen\server:/app \
		-v /app/node_modules \
		--env-file ./config/development.env \
		notes-backend

frontend:
	docker run -p 3000:3000 \
		-d \
		--rm \
		--name notes-frontend \
		--network notes-net \
		-e CHOKIDAR_USEPOLLING=true \
		-v D:\SHAREWOOD\docker-practicum-vladilen\client\src:/app/src \
		notes-frontend

stop:
	docker stop mongodb notes-frontend notes-backend

dev:
	docker-compose -f docker-compose.yml up -d

build:
	docker-compose -f docker-compose.production.yml up

down:
	docker-compose down

#SSH

SSH_STRING:=root@84.38.180.76

ssh:
	ssh root@84.38.180.76

copy:
	scp -r ./* root@84.38.180.76:/root/app

path:
	echo %PATH%
