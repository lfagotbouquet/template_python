#!/bin/bash
# shellcheck shell=bash

# Move to the directory containing this script safely
cd "$(dirname "$0")" || exit

# Load environment variables
# shellcheck source=/dev/null
source set_env_variables.sh

# Remove containers and local images
docker compose down --rmi local
