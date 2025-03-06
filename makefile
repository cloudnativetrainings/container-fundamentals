.PHONY: verify
verify:
	docker --version
	podman --version
	dive --version
	hadolint --version
	echo "Training Environment successfully verified"
