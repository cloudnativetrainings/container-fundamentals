# Docker Compose

In this lab, we will install a minimal Prometheus stack via Docker Compose.

Navigate to the folder `22_docker-compose` from the CLI before you get started.

```bash
cd /training/22_docker-compose
```

## Verify that docker compose is installed

> Docker Compose comes pre-installed in your training environment.

Verify the installation

```bash
docker compose version
```

## Create a container

> This container will be monitored afterwards via the Prometheus stack.

```bash
docker run -d --name my-nginx -p 8081:80 nginx:1.23.1
```

## Inspect the file `prometheus.yaml`

```bash
cat prometheus.yaml
```

## Inspect the Docker Compose file called `docker-compose.yaml`

```bash
cat docker-compose.yaml
```

## Start all containers

- Using `docker compose`, start all the containers as follows.

```bash
docker compose up -d
```

- Verify everything is working

```bash
# via docker
docker ps

# via docker compose
docker compose ps
```

- Verify the exposed metrics of cAdvisor. Note that there are a lot of metrics.

```bash
curl localhost:8080/metrics
```

- Visit Grafana in your Browser (User admin, Password admin) on port 80 via http.

> You can get the URL of your Codespaces instance via the command below:

```bash
echo "https://${CODESPACE_NAME}-80.app.github.dev/"
```

## Create a Datasource

Create a Datasource of type `Prometheus` and the URL `http://prometheus:9090`

## Import a Dashboard

Import the Dashboard with id `193`. Set the Datasource to the previously generated one.

## Cleanup

```bash
# Remove all the containers created by docker-compose
docker compose down

# remove nginx container
docker rm -f my-nginx 
```
