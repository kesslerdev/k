REVISION := $(shell git rev-parse --short HEAD)
BUILDTIME := $(shell date -u '+%Y-%m-%dT%H:%M:%SZ')
USER := $(shell id -u -n)

GOLDFLAGS += -X github.com/kesslerdev/ki/build.Revision=$(REVISION)
GOLDFLAGS += -X github.com/kesslerdev/ki/build.Time=$(BUILDTIME)
GOLDFLAGS += -X github.com/kesslerdev/ki/build.User=$(USER)
GOFLAGS = -ldflags "$(GOLDFLAGS)"

.PHONY: run build
run: build
	./ki

build:
	go build -o ki $(GOFLAGS) main.go
