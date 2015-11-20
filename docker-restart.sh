#!/bin/bash
set -x

echo -n "Enter version:"
read version

# Remove docker
docker rm -f api-staging api2
# Restart docker - First instance
docker run -d -v /data/logs/cat-api-staging/:/app/log:rw -p 80:80 --env-file /var/lib/docker/env/cat-api-rails-env --name api-staging catalinalabs/cat-api:$version

# Restart docket - Second instance
docker run -d -v /data/logs/cat-api-2/:/app/log:rw -p 81:80 --env-file /var/lib/docker/env/cat-api-rails-env --name api2 catalinalabs/cat-api:$version && docker ps