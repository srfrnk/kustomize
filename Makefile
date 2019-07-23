FORCE:

install: build
	sudo cp bin/kustomize /usr/local/bin

build: FORCE
	go build -o bin/kustomize sigs.k8s.io/kustomize/v3/cmd/kustomize

test: build FORCE
	./bin/kustomize build test/overlays/staging
