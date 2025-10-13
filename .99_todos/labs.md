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
