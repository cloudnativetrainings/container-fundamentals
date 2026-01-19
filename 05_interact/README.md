# Interacting

In this training, you will learn how to interact with a container.

> Note that we are overwriting the CMD from the Dockerfile via `sh -c "while true; do date; sleep 1; done"`. This will be covered in a following training.

## Naming Containers

> Note that when you do not provide `--name` parameter, the containers got some randomly generated names.

```bash
# start some containers
docker run -d nginx:1.23.1
docker run -d --name my-nginx-1 nginx:1.23.1
docker run -d --name my-nginx-2 nginx:1.23.1
docker run -d --name my-nginx-3 nginx:1.23.1

# get the log info of the container with the name my-nginx-2
docker logs my-nginx-2

# list all running containers
docker ps

# get the log info of the container with the name my-nginx-2 via the container id
docker logs <TYPE-IN-THE-FIRST-TWO-LETTERS-OF-THE-CONTAINER-ID>

# cleanup
docker rm -f $(docker ps -qa)
```

## Attach to the process with PID 1 in the container

```bash
# start a Container in detached mode
docker run -it --rm -d --name my-busybox busybox:1.32.0 sh -c "while true; do date; sleep 1; done"

# attach to the process inside the container
docker attach my-busybox

# exit the container via CTRL+C. Note the container got stopped and removed afterwards (due to the --rm flag on starting the container)
docker ps -a
```

## Spawn a new process in the container and attach to it

```bash
# Start a Container in detached mode
docker run -it --rm -d --name my-busybox busybox:1.32.0 sh -c "while true; do date; sleep 1; done"

# start a new shell process inside the container
docker exec -it my-busybox sh

# take a look at the running processes inside the container. There are additional processes beside the process with the PID 1.
ps aux

# exit the container
exit

# note that the container is still running
docker ps
```

## Cleanup

```bash
docker rm -f my-busybox
```
