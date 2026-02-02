# setup VM: install countdown tool (only for trainer)

# new lab: add wormhole pattern lab

# new lab: creating a base image from scratch => golden image

# move podman lab after hadolint

# new lab => verify images via cosign

# new lab => image from scratch without Dir and Dockerfile

# ARG vs ENV -> passing params into docker build

# 03 foreground container

- ctrl p ctrl q funktioniert im browser nicht
- order of 2 containers confusing... nnot idempotent =>

# missing lab

debug docker build

# 10 exec/shell -> variable substitution

## get param substitution in CMD and PID1 in ENTRYPOINT

```docker
ENTRYPOINT [ "/bin/echo" ] => EXEC form, app gets pid1
CMD $FOO => SHELL form, $FOO gets substituted
```

# add manual sigterm signal

kill -s SIGTERM 34649 => for training-application

# compose cadvisor issue

```json
# /etc/docker/daemon.json
{
  "metrics-addr": "0.0.0.0:9323",
  "experimental": true
}
```

doing this in devcontainer.json works

```json
  "mounts": [
    {
      "source": "dind-var-lib-docker",
      "target": "/var/lib/docker",
      "type": "volume"
    }
```

but docker `localhost:9323/metrics` endpoint does not deliver any good metrics

# lab 03

detach keys on lab 03 funktioniert bei edge nicht

# lab 17

shell vs execform is not correct
ENTRYPOINT ["/bin/sh", "-c", "exec ps aux"] <= this is correct

# lab 16 and 17

- order of things

- use exec !!!

# lab 19 entrypoint and cmd inconsistancy
