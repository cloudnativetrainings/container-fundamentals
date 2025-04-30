.PHONY: verify
verify:
	test -f /root/.trainingrc
	grep "source /root/.trainingrc" /root/.bashrc
	docker --version
	podman --version
	dive --version
	hadolint --version
	docker compose version
	echo "Training Environment successfully verified"
