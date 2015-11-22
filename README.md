# Jenkins

To allow jenkins to push/pull from private registry with self-signed cert:

`DOCKER_OPTS="$DOCKER_OPTS --insecure-registry=docker.catalina.internal:5000"`
