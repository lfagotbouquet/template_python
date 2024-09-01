#!/bin/bash

cd "$(dirname "$0")"
source set_env_variables.sh

# Get an interactive bash session
docker compose exec project_name bash
