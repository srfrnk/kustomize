FORCE:

install: FORCE
	go install sigs.k8s.io/kustomize/v3/cmd/kustomize

build: FORCE
	go build sigs.k8s.io/kustomize/v3/cmd/kustomize

test: build FORCE
	./kustomize build test/overlays/staging
