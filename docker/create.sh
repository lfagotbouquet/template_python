#!/bin/bash

cd "$(dirname "$0")"
source set_env_variables.sh

# Build the image and run the container in background
docker compose up -d

# Get an interactive bash session in the container
docker compose exec project_name bash
