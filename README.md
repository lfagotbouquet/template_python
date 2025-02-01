# Base Python template

## Installation

Note: This project is supposed to be installed on Linux systems, and was only
tested on Ubuntu 22.04 with Python 3.11.9\
You will need a sudo user to install some system dependencies for this project.\
A Dockerfile is provided in the subfolder `docker` to build an ubuntu-based image
for this project if needed as explained in the next section.

### Docker (optional)

Prerequisites: Docker engine and Nvidia container toolkit.\
Follow instructions here: https://docs.nvidia.com/ai-enterprise/deployment-guide-vmware/0.1.0/docker.html

A Dockerfile and a `compose.yaml` file are provided in the subfolder `docker` to
eventually create a Docker container for this project.

Run `./docker/create.sh` to build the related image, run the container in background
and get an interactive bash session in the container.\
This session can be exited by typing `exit`.\
A new interactive bash session can be launched by running `./docker/exec.sh`.\
Finally, the created image and containers can be removed with the script `./docker/remove.sh`.

Notes:

- The scripts require that the host machine is using Ubuntu with bash installed.\
  But the provided Dockerfile and `compose.yaml` file can be used on other operating systems.\
  In that case, you need to set some environment variables for the `compose.yaml` file (the ones set
  by the script `set_env_variables.sh`).

- Inside the created container, a sudo user will be created with the same username, uid
  and gid as your user on the host machine.\
  This makes possible to read and write files inside the Docker container without permission issues.\
  The eventual `~/.ssh` folder and `~/.gitconfig` file are also mounted (read-only) in the container
  to allow working on the project with git (to pull and push branches/commits from/to the git remote).\
  An error will be raised if no `~/.ssh` folder or `~/.gitconfig` file is found on the host machine.\
  In that case, remove the related volumes from the `compose.yaml` file to create a container
  without having the host ssh folder and/or .gitconfig file mounted.

- In the Dockerfile, you eventually need to change the version of the nvidia image
  based on the nvidia driver version of your machine.\
  Check https://docs.nvidia.com/deploy/cuda-compatibility/ for more explanations.

### System requirements

Run `./install_scripts/install_system_requirements.sh` to install the system dependencies for
this project.\
NOTE: You need to have a sudo user for this.

### Full installation using make

WARNING: This installation procedure will install pyenv for your user account.\
You can follow the step-by-step procedure described in the next section instead if you prefer to select
what you really want to install for this project.

In the root folder of this project, run `make` to install all the dependencies required.
Then, run `source .venv/bin/activate` to install the local Python virtual environment in the `.venv` subfolder.
NOTE: This virtual environment can be deactivated by running the command `deactivate`.

Eventually, run `source ~/.bashrc` to initialize pyenv in the current shell.

### Step-by-step install

NOTE: You can skip this section if you installed the project as explained in the previous section
with the `make` command.

#### Local virtual environment using pyenv and venv

It is strongly advised to use a virtual Python environment to install this project.\
The approach described here relies on pyenv and venv, but other tools can also be
considered (virtualenv, pyenv-virtualenv, miniconda...).

Run `curl https://pyenv.run | bash` to install pyenv.\
Follow the instructions displayed at the end of this script to update your `~/.bashrc` file
(or equivalent file depending on your shell).
Restart your shell or run `source ~/.bashrc` to initialize pyenv in the current shell.

In the root folder of this project, run

`pyenv install 3.11.9 && pyenv local 3.11.9 && python -m venv .venv && pyenv local --unset`

to install Python 3.11.9 with pyenv and to create a local Python 3.11.9 environment in a .venv folder.

Activate this environment using

`source .venv/bin/activate`

NOTE: This virtual environment can be deactivated by running the command `deactivate`.

#### Python dependencies

Install the Python dependencies of this project with

`pip install -r requirements.txt`

#### Project package editable install

Install the Python project package in editable mode using

`pip install -e .`

#### Pre-commit install

To install and use pre-commit hooks, run

```
pre-commit install
pre-commit install-hooks
```
