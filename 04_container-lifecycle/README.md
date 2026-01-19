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

## Cleanup

```bash
# Remove all the containers
docker rm -f $(docker ps -qa)

# Remove all the images
docker rmi -f $(docker images -qa)
```
