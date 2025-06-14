# Caching

In this training, you will learn how to write Dockerfiles which will decrease build time due to using caches.

Navigate to the folder `13_caching` from CLI, before you get started.

```bash
cd /workspaces/container-fundamentals/13_caching
```

## Inspect the Dockerfile and the server.js file

```bash
cat Dockerfile
cat server.js
```

## Build and run the docker image

```bash
docker build -t webserver:1.0.0 .
docker run -it -d --rm --name my-webserver -p 80:80 webserver:1.0.0
```

> Visit the site via the external IP of your VM on port 80 via http

### Remove the container

```bash
docker rm -f my-webserver
```

## Re-build the docker image

```bash
docker build -t webserver:1.0.0 .
```

> Note that all layers are taken from the cache.

## Adapt the application and re-build the docker image

Change the message to something different in the file `server.js`

```bash
docker build -t webserver:1.0.0 .
docker run -it -d --rm --name my-webserver -p 80:80 webserver:1.0.0
```

> Visit the site via the external IP of your VM on port 80 via http
> Note that all layers starting from the `RUN npm install` layer are not taken from the cache. On bigger projects, this can increase your build times significantly.

### Remove the container

```bash
docker rm -f my-webserver
```

## Fix the Dockerfile

- Change the content of the Dockerfile to this

```docker
FROM node:12
WORKDIR /app
COPY package.json .
RUN npm install
COPY server.js .
ENTRYPOINT [ "npm" ]
CMD [ "start" ]
```

- Do the initial build

```bash
docker build -t webserver:2.0.0 .
```

- Re-build the docker image

Change the message to something different in the file `server.js`.

```bash
docker build -t webserver:2.0.0 .
docker run -it -d --rm --name my-webserver -p 80:80 webserver:2.0.0
```

> Visit the site via the external IP of your VM on port 80 via http
> Note the layers which are taken from the cache.

## Cleanup

```bash
# Remove all the containers
docker rm -f $(docker ps -qa)

# Remove all the images
docker rmi -f $(docker images -qa)
```
