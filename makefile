.PHONY: verify
verify:
	test -f /root/.trainingrc
	grep "source /root/.trainingrc" /root/.bashrc
	docker --version
	podman --version
	dive --version
	hadolint --version
	docker compose version
	docker info
# 	curl --unix-socket /var/run/docker.sock http://localhost/version
	echo "Training Environment successfully verified"
