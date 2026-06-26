# Create a webserver image

In this lab, we will create an image with a customized webserver.

Navigate to the folder `12_dockerfile-webserver` from the CLI before you get started.

```bash
cd /training/12_dockerfile-webserver
```

## Inspect the Dockerfile

```bash
cat Dockerfile
```

## Build the image

```bash
docker build -t my-webserver:1.0.0 .
```

> The flag `-t my-webserver:1.0.0` defines the name and the version of the resulting image.
> The argument `.` tells the build process the location of the build context.

## Run a webserver container from the newly built image

```bash
docker run -it -d -p 80:80 my-webserver:1.0.0
```

Verify the output with curl command

```bash
curl localhost:80
```

## Cleanup

```bash
# Remove all the containers
docker rm -f $(docker ps -qa)

# Remove all the images
docker rmi -f $(docker images -qa)
```
