RELEASE_VER	:= $(shell git rev-parse --short HEAD)

run:
		go run main.go -d

build:
		mkdir -p build
		GOOS=linux go build -o build/miniserver-linux -ldflags "-X main.version=$(RELEASE_VER)" .

docker: build
		docker build -t wincus/miniserver:latest .

push: docker
		docker push wincus/miniserver:latest

start: docker
		docker-compose up -d

logs: 
		docker-compose logs

stop:
		docker-compose stop	

clean:
		docker-compose rm -f

.PHONY: run build docker start logs stop clean
