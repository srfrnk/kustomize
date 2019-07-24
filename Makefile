SHELL := /bin/bash
FORCE:

install: build
	sudo cp bin/kustomize /usr/local/bin

build: FORCE
	go build -o bin/kustomize sigs.k8s.io/kustomize/v3/cmd/kustomize

test: build FORCE
	pushd test/overlays/staging && ../../../bin/kustomize edit set image ttt=111 && popd
	pushd test/overlays/staging && export ENABLE_RISKY=true && ../../../bin/kustomize build && popd
	pushd test/overlays/staging && ../../../bin/kustomize edit set image ttt=222 && popd
