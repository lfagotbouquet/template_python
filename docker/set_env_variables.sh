#!/bin/bash
# shellcheck shell=bash

# Retrieve host UID, GID, and username
HOST_UID=$(id -u)
HOST_GID=$(id -g)
HOST_USERNAME=$(whoami)

export HOST_UID
export HOST_GID
export HOST_USERNAME

# Host SSH folder
HOST_SSH_FOLDER=""
if [ -d "$HOME/.ssh" ]; then
	HOST_SSH_FOLDER="$HOME/.ssh"
fi
export HOST_SSH_FOLDER

# Host Git config file
HOST_GITCONFIG_FILE=""
if [ -f "$HOME/.gitconfig" ]; then
	HOST_GITCONFIG_FILE="$HOME/.gitconfig"
fi
export HOST_GITCONFIG_FILE
