# Docker Fluentd forwarder for LogSense

The following Logsense forwarder image can be used to set up your fluentd forwarder as Docker container.

It can be run as follow:
```
$ docker run \
  --env "LOGSENSE_TOKEN=your logsense token" \
  -p 127.0.0.1:24224:24224 \
  logsenseapp/fluentd-forwarder
```

Please use your `Logsense token` in the `LOGSENSE_TOKEN` env variable.

`-p 127.0.0.1:24224:24224` - this line is to make sure your forwarder is accessible from the host only.

It can also be run using the using Docker Compose using the following [configuration](docker-compose.yaml):

```
version: "3"

services:
  logsense-forwarder:
    image: logsenseapp/fluentd-forwarder
    environment:
      - "LOGSENSE_TOKEN=your logsense token"
    ports:
      - "127.0.0.1:24224:24224"
```

Please edit the `docker-compose.yaml` file in order to use your customer token in the `LOGSENSE_TOKEN` env variable.

The service can be run with the following command:
```$ docker-compose up -d```

## How to send logs from the Docker container

To use your Fluentd forwarder by Docker containers you need to specify log-driver options for them:

```$ docker run --log-driver=fluentd --log-opt fluentd-address=localhost:24224 IMAGE_NAME```

One can always set those options in the [docker deamon configuration](daemon.json) so that every container run on the host use them:

```
{
  "log-driver": "fluentd",
  "log-opts": {
    "fluentd-address": "127.0.0.1:24224"
  }
}
```

Also logging driver can be set in the Docker Compose configuration:
```
version: "3"

services:
  SERVICE_NAME:
    image: SERVICE_IMAGE
    logging:
      driver: fluentd
      options:
        fluentd-address: "127.0.0.1:24224"
```
