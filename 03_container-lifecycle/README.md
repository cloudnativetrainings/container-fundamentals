# Container Lifecycle

In this training, you will learn about the lifecycle of a container.

## The Difference between stop/kill/rm

### Stop a running container

```bash
# start a container
docker run -d --name my-nginx nginx:1.23.1

# stop the container
docker stop my-nginx
```

> Stop the started container. The main process inside the container will receive `SIGTERM`, and after a grace period, `SIGKILL`.

Inspect the ExitCode

```bash
docker inspect my-nginx | jq '.[].State'
```

#### Restart a stopped container

```bash
docker restart my-nginx
```

### Kill a container

If you have e.g. an hanging container, it's possible to send the `SIGKILL` signal directly. Try

```bash
docker kill my-nginx
```

> Kill the started container. The main process inside the container will get killed without receiving a `SIGTERM` signal upfront. This means graceful shutdown will not happen which results in possible data loss.

Inspect the ExitCode

```bash
docker inspect my-nginx | jq '.[].State'
```

The container is still startable

```bash
docker restart my-nginx
```

### Remove a container

```bash
docker rm my-nginx
```

> Note that the container has to be stopped before it can be removed. You can also use the `--force` or `-f` flag.

```bash
# forcing the removal of the container (danger zone!!!)
docker rm -f my-nginx

# try to restart the container
docker restart my-nginx
```

> The container cannot be started anymore. Any data written to the R/W layer of the container are lost.

## Using the container id

Start some containers

```bash
docker run -d --name my-nginx-1 nginx:1.23.1
docker run -d --name my-nginx-2 nginx:1.23.1
docker run -d --name my-nginx-3 nginx:1.23.1
```

List all running containers

```bash
docker ps
```

> Note that when you do not provide `--name` parameter, the containers got some randomly generated names. You can either use these names or you can the first letters of the container id to define the container in the commands.

## Detach Keys

### Foreground Containers

- Start a container which prints the current date every second on the console

```bash
docker run -it --detach-keys="ctrl-p,ctrl-d" --name my-busybox \
  busybox:1.32.0 sh -c "while true; do date; sleep 1; done"
```

> Note that you have to start the container with the flags `--interactive` or `-i` and `--tty` or `-t` i.e. together `-it`.

- To detach from the container, press `Ctrl+p` followed by `Ctrl+d`. Verify the status of the container.

> Default sequence is `Ctrl+p` `Ctrl+q`
>
> More info can be found on [docker documentation](https://docs.docker.com/reference/cli/docker/container/attach/)

```bash
docker ps
```

> Note that the container is still running.

- Re-attach to the container

```bash
docker attach my-busybox
```

- To stop it, press `Ctrl+c`. Verify the status of the container.

```bash
docker ps -a
```

> Note that the container is stopped with `EXITED` status.

- You cannot attach again to the container until it gets restarted.

```bash
docker attach my-busybox
```

- Cleanup

```bash
docker rm -f my-busybox
```

### Detached Containers

- Start a container which prints the current date every second on the console

```bash
docker run -it -d --name my-busybox busybox:1.32.0 sh -c "while true; do date; sleep 1; done"
```

> It will start a container in detached mode using `-d` flag.

- Attach local standard input, output, and error streams to a running container

```bash
docker attach my-busybox
```

- To stop it, press `Ctrl+c`. Verify the status of the container.

```bash
docker ps -a
```

> Note that the container is stopped with `EXITED` status.

- Cleanup

```bash
docker rm -f my-busybox
```

## Cleanup

```bash
# Remove all the containers
docker rm -f $(docker ps -qa)

# Remove all the images
docker rmi -f $(docker images -qa)
```
