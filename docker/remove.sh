#!/bin/bash

cd "$(dirname "$0")"
source set_env_variables.sh

# Removes the created containers and image
docker compose down --rmi local
