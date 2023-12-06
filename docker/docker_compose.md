# Docker compose (V2)
Compose is a tool for defining and running multi-container Docker applications. With Compose, you use a YAML file to configure your application's services. Then, with a single command, you create and start all the services from your configuration

## Compose file
A compose.yaml looks like this:

```yml
services:
  <backend>:
    build: .
    ports:
      - "8000:5000"
    environment:
      - <VARIABLE_NAME>=variable_value
    profiles:
      - <profile_name>
    volumes:
      - .:/code
      - logvolume01:/var/log
    depends_on:
      - redis
  <frontend>
  <database>:
    image: <image_tag>:<image_version>
    container_name: <container_name>
    ports:
      - "<container_port>:<host_port>"
volumes:
  logvolume01: {}
```

Services refer to the containers’ configuration.

Environment variables can help you define various configuration values.

Profiles help you adjust the Compose application model for various uses and environments by selectively starting services. This is achieved by assigning each service to zero or more profiles. If unassigned, the service is always started but if assigned, it is only started if the profile is activated. To start a specific profile supply the --profile command-line option.

Volumes are physical areas of disk space shared between the host and a container, or even between containers. In other words, a volume is a shared directory in the host, visible from some or all containers.


Networks define the communication rules between containers, and between a container and the host. Common network zones will make the containers’ services discoverable by each other, while private zones will segregate them in virtual sandboxes.

For more information about the Compose file, see the [Compose file reference](https://docs.docker.com/compose/compose-file/).

### Have multiple isolated environments on a single host
Compose uses a project name to isolate environments from each other.

The default project name is the base name of the project directory. You can set a custom project name by using the -p command line option or the COMPOSE_PROJECT_NAME environment variable.

The default project directory is the base directory of the Compose file. A custom value for it can be defined with the --project-directory command line option.

## Commands
```sh
docker compose [--profile <profile_name>] up [-d]
```

```sh
docker compose ps
```

```sh
docker compose start
```

```sh
docker compose stop
```

```sh
docker compose down
```
