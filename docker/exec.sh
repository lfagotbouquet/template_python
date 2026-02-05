#!/bin/bash
# shellcheck shell=bash

# Move to the directory containing this script safely
cd "$(dirname "$0")" || exit

# Load environment variables
# shellcheck source=/dev/null
source set_env_variables.sh

# Get an interactive bash session
docker compose exec template_project bash
