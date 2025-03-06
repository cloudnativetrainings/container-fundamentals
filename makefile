.PHONY: verify
verify:
	docker --version
	podman --version
	dive --version
	hadolint --version
	docker compose version
	echo "Training Environment successfully verified"
