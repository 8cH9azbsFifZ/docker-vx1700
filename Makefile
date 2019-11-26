build:
	docker build . -t docker-vx1700
	docker build . -t asdlfkj31h/vx1700:0.2

push:
	docker push asdlfkj31h/vx1700:0.2

