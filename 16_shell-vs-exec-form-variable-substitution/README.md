# Exec vs Shell form - variable substitution

In this training, you will learn the difference between exec and shell form concerning variable substitution.

Navigate to the folder `16_shell-vs-exec-form-variable-substitution` from CLI, before you get started.

```bash
cd /training/16_shell-vs-exec-form-variable-substitution
```

## Inspect the Dockerfile

```bash
cat Dockerfile
```

> You can see the exec form of `ENTRYPOINT`

## Build the image

```bash
docker build -t shell-vs-exec-form-vars:1.0.0 .
```

## Run a container from the image

```bash
docker run -it shell-vs-exec-form-vars:1.0.0
```

> Note that variable substitution for the environment variable $FOO did not happen.

## Change the entrypoint to the Shell Form in the Dockerfile

```docker
ENTRYPOINT /bin/echo $FOO
```

> This is shell form of `ENTRYPOINT`

## Rebuild the image

```bash
docker build -t shell-vs-exec-form-vars:2.0.0 .
```

## Run a container from the new image

```bash
docker run -it shell-vs-exec-form-vars:2.0.0
```

> Note that variable substitution happened this time.

## How to have variable substitution via Exec Form

In the next lab you will learn about the big problem with the Shell form. So we have to find a way to get variable substitution via Exec Form.

```docker
ENTRYPOINT ["/bin/sh", "-c", "echo $FOO"]
```

```bash
# build the image again and run a container 
docker build -t shell-vs-exec-form-vars:3.0.0 .
docker run -it shell-vs-exec-form-vars:3.0.0
```

> Note that variable substitution happened this time via Exec Form.

## Cleanup

```bash
# Remove all the containers
docker rm -f $(docker ps -qa)

# Remove all the images
docker rmi -f $(docker images -qa)
```
