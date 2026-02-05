#!/bin/bash
# shellcheck shell=bash

# Move to the directory containing this script safely
cd "$(dirname "$0")" || exit

# Load environment variables
# shellcheck source=/dev/null
source set_env_variables.sh

# Build the image and run the container in the background
docker compose up -d

# Get an interactive bash session in the container
docker compose exec template_project bash
