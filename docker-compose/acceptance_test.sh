#!/bin/sh

set -Ceu
# set -vx # for debug

POSTGRES_VERSION=${1:-postgres12}
DOCKER_COMPOSE_FILE=${2:-docker-compose.yml}
docker-compose -f "$DOCKER_COMPOSE_FILE" -f "docker-compose/$POSTGRES_VERSION.yml" run -e "POSTGRES_HOST=$POSTGRES_VERSION" app acceptance/run_test.sh
