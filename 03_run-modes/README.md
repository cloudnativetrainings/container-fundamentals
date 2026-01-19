# Run Modes

In this lab you will learn about foreground and detached containers.

## Foreground Containers

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
docker attach --detach-keys="ctrl-p,ctrl-d" my-busybox
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

## Detached Containers

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
