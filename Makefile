VERSION = 0.1.0
REVISION := $(shell git rev-parse --short HEAD)
BUILDTIME := $(shell date -u '+%Y-%m-%dT%H:%M:%SZ')
USER := $(shell id -u -n)

GOLDFLAGS += -X github.com/kesslerdev/kli/internal/build.Version=$(VERSION)
GOLDFLAGS += -X github.com/kesslerdev/kli/internal/build.Revision=$(REVISION)
GOLDFLAGS += -X github.com/kesslerdev/kli/internal/build.Time=$(BUILDTIME)
GOLDFLAGS += -X github.com/kesslerdev/kli/internal/build.User=$(USER)
GOFLAGS = -ldflags "$(GOLDFLAGS)"

.PHONY: run build
run: build
	./kli

build:
	go build -o kli $(GOFLAGS) main.go

annalyse:
	go tool nm ./kli | grep 'kesslerdev/kli'
