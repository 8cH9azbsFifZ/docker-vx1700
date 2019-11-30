build:
	docker build . -t docker-vx1700
	docker build . -t asdlfkj31h/vx1700:0.4

run:
	docker run --rm -it -p 8080:8080 asdlfkj31h/vx1700:0.4


push:
	docker push asdlfkj31h/vx1700:0.4

