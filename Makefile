VERSION = 0.1.0
REVISION := $(shell git rev-parse --short HEAD)
BUILDTIME := $(shell date -u '+%Y-%m-%dT%H:%M:%SZ')
USER := $(shell id -u -n)

GOLDFLAGS += -X github.com/kesslerdev/k/internal/build.Version=$(VERSION)
GOLDFLAGS += -X github.com/kesslerdev/k/internal/build.Revision=$(REVISION)
GOLDFLAGS += -X github.com/kesslerdev/k/internal/build.Time=$(BUILDTIME)
GOLDFLAGS += -X github.com/kesslerdev/k/internal/build.User=$(USER)
GOFLAGS = -ldflags "$(GOLDFLAGS)"

.PHONY: run build
run: build
	./k

build:
	go build -o k $(GOFLAGS) main.go

annalyse:
	go tool nm ./k | grep 'kesslerdev/k'
