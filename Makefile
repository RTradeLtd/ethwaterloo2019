# cleanup dependencies and download missing ones
.PHONY: deps
deps:
	go mod tidy
	go mod download

# run dependency cleanup, followed by updating the patch version
.PHONY: deps-update
deps-update: deps
	go get -u=patch
	
# run tests
.PHONY: tests
tests:
	go test -race -cover -count 1 ./...

# run standard go tooling for better rcode hygiene
.PHONY: tidy
tidy: imports fmt
	go vet ./...
	golint ./...

# automatically add missing imports
.PHONY: imports
imports:
	find . -type f -name '*.go' -exec goimports -w {} \;

# format code and simplify if possible
.PHONY: fmt
fmt:
	find . -type f -name '*.go' -exec gofmt -s -w {} \;

.PHONY: setup-python
setup-python:
	sudo apt install postgresql-server-dev-10 postgresql-10
	sudo apt install python3-pip
	pip3 install Flask
	pip3 install web3
	pip3 install SQLAlchemy
	pip3 install psycopg2

.PHONY: run-python
run-python:
	flask run --host=0.0.0.0