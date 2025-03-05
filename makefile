.PHONY: verify
verify:
	podman --version
	echo "Training Environment successfully verified"

	# cat /var/log/cloud-init-output.log | grep "CloudInit Finished Successfully"
	# test -f /root/.trainingrc
	# kubectx
	# kubens
	# kubectl krew version
	# netstat -tulpan | grep 8088 # check if openlitespeed is blocking port 8088
	# containerd --version
	# kubelet --version
	# kubeadm version
	# kubectl version
	# test -n "$(IP)"
	# test -n "$(API_SERVER)"
	# kubectl get node $(hostname) | grep Ready
	# kubectl -n kube-system get pod -l k8s-app=metrics-server | grep Running
	# kubectl -n default get pod my-suboptimal-pod | grep Running
	# openssl version
	# kubesec version
	# trivy --version
	# strace --version
	# apparmor_status --enabled
	# runc --version
	# runsc --version
	# falco --version
