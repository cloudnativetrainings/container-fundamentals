# Images

In this training, you will learn how to manage images.

## Search for an image

- Check if image is available or not on Docker Hub (default registry for docker images).

```bash
docker search nginx
```

## Download an image

- You can pull an image from Docker Hub using below pull command, which can be used for container creation afterwards. Adjust the image tag to download required version.

```bash
docker pull nginx:1.23.1
```

## List local docker images

- To verify images is available locally, use following command

```bash
docker images
```

## Start a container

- Let's start a container from the downloaded local image in the previous step.

```bash
docker run -d --name my-nginx nginx:1.23.1
```

## Remove a local docker image

- Try to remove the local image which was downloaded before.

```bash
# remove the image
# note that this will not work due to an instance of the image (so, a container) is currently running
docker rmi nginx:1.23.1

# remove the container
# note this will not work due to safety mechanisms of docker, you have to stop the running container first 
docker rm my-nginx

# stop the container
docker stop my-nginx

# remove the container
docker rm my-nginx

# finally, remove the image
docker rmi nginx:1.23.1
```
