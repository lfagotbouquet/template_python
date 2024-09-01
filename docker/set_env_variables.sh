# Retrieve host's name, uid and gid
export HOST_UID=$(id -u)
export HOST_GID=$(id -g)
export HOST_USERNAME=$(whoami)

export HOST_SSH_FOLDER=
if [ -d ~/.ssh ]; then
    export HOST_SSH_FOLDER="~/.ssh"
fi

export HOST_GITCONFIG_FILE=
if [ -f ~/.gitconfig ]; then
    export HOST_GITCONFIG_FILE="~/.gitconfig"
fi
