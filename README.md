# Container Fundamentals

## Setup the training environment

1. Open [Github Codespaces](https://github.com/codespaces) and create your new `cloudnativetrainings/container-fundamentals` codespace with `Machine Type` `4-core`.
2. Verify your environment via `make verify`.

  > If this fails, please run the following command (Github Codespaces having currently this issue: https://github.com/devcontainers/features/issues/1494)

  ```bash
  kill $(pgrep dockerd)
  dockerd &
  ```

3. Start with the [01_hello-docker](./01_hello-docker/README.mdd) lab.

## Teardown the training environment

1. Delete your `cloudnativetrainings/container-fundamentals` codespace via [Github Codespaces](https://github.com/codespaces).
