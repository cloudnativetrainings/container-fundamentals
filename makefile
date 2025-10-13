.PHONY: verify
verify:
	test -f /root/.trainingrc
	grep "source /root/.trainingrc" /root/.bashrc
	docker --version
	podman --version
	dive --version
	hadolint --version
	docker compose version
# 	add docker socket check on each dind based training
	docker info
# 	curl --unix-socket /var/run/docker.sock http://localhost/version
	echo "Training Environment successfully verified"
