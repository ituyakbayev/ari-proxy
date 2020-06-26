
all: dep check build test

ci: check build test

build:
	go build ./...
	go build

check:
	go mod verify
	golangci-lint run

dep:
	go mod tidy

docker: all
	docker build -t ituyakbayev/ari-proxy ./
	docker push ituyakbayev/ari-proxy

test:
	go test ./...

