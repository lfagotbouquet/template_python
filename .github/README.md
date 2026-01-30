# Base Python Template

![Python](https://img.shields.io/badge/python-3.11.9-blue.svg)
![License](https://img.shields.io/badge/license-MIT-green.svg)
![Platform](https://img.shields.io/badge/platform-Linux-lightgrey.svg)

A ready-to-use, plug-and-play Python project template with pre-configured tooling for code quality, security analysis, and containerization.

## Features

- **Code Quality**: Pre-commit hooks with Ruff (linting + formatting), Mypy (type checking), and Docformatter
- **Security**: Automated security scanning with Bandit
- **Shell Scripts**: Linting with shfmt and ShellCheck
- **Commit Standards**: Conventional commit message enforcement
- **Containerization**: Docker support with optional GPU/NVIDIA capabilities
- **Environment Management**: Pyenv + venv for reproducible Python environments
- **CI Integration**: Pre-commit.ci ready with auto-fix and weekly updates
- **Governance**: Ready-to-use templates for open source collaboration

---

## Table of Contents

- [Quick Start](#quick-start)
- [Installation](#installation)
  - [System Requirements](#system-requirements)
  - [Full Installation (make)](#full-installation-using-make)
  - [Step-by-Step Installation](#step-by-step-installation)
- [Docker Setup (Optional)](#docker-setup-optional)
- [Project Structure](#project-structure)
- [Pre-commit Hooks](#pre-commit-hooks)
- [Project Governance Files](#project-governance-files)

---

## Quick Start

For users who want to get started quickly:

```bash
# Install system dependencies (requires sudo)
./install_scripts/install_system_requirements.sh

# Install everything with make
make

# Activate the virtual environment
source .venv/bin/activate

# You're ready to go!
```

---

## Installation

> **Note:** This project is designed for Linux systems and has been tested on Ubuntu 22.04/24.04 with Python 3.11/3.12/3.13.

### System Requirements

Install the system dependencies for this project:

```bash
./install_scripts/install_system_requirements.sh
```

> **Note:** You need sudo access for this step.

### Full Installation Using make

> **Warning:** This procedure will install pyenv for your user account. See [Step-by-Step Installation](#step-by-step-installation) if you prefer more control over what gets installed.

1. Run the installation:

   ```bash
   make
   ```

2. Activate the virtual environment:

   ```bash
   source .venv/bin/activate
   ```

3. Initialize pyenv in your current shell (if needed):

   ```bash
   source ~/.bashrc
   ```

> **Tip:** Deactivate the virtual environment anytime by running `deactivate`.

### Step-by-Step Installation

Skip this section if you used the `make` command above.

#### 1. Set Up Virtual Environment (pyenv + venv)

It is strongly recommended to use a virtual Python environment. This guide uses pyenv and venv, but alternatives like virtualenv, pyenv-virtualenv, or miniconda also work.

**Install pyenv:**

```bash
curl https://pyenv.run | bash
```

Follow the instructions displayed to update your `~/.bashrc` (or equivalent shell config), then restart your shell or run:

```bash
source ~/.bashrc
```

**Create the virtual environment:**

```bash
pyenv install 3.11.9 && pyenv local 3.11.9 && python -m venv .venv && pyenv local --unset
```

**Activate the environment:**

```bash
source .venv/bin/activate
```

#### 2. Install Python Dependencies

```bash
pip install -r requirements.txt
```

#### 3. Install Project Package (Editable Mode)

```bash
pip install -e .
```

#### 4. Set Up Pre-commit Hooks

```bash
pre-commit install
pre-commit install-hooks
```

---

## Docker Setup (Optional)

Docker support is provided for containerized development, with optional NVIDIA GPU support.

### Prerequisites

- Docker Engine
- NVIDIA Container Toolkit (only if using GPU features)

For GPU setup, follow: <https://docs.nvidia.com/ai-enterprise/deployment-guide-vmware/0.1.0/docker.html>

> **Note:** GPU/NVIDIA support is optional. The Docker setup works without it for CPU-only workloads.

### Usage

| Command | Description |
|---------|-------------|
| `./docker/create.sh` | Build image, start container, open interactive shell |
| `./docker/exec.sh` | Open a new shell in the running container |
| `./docker/remove.sh` | Remove the image and containers |

Exit the container shell by typing `exit`.

### Important Notes

- **Cross-platform compatibility:** The helper scripts require Ubuntu with bash. On other operating systems, use the `Dockerfile` and `compose.yaml` directly, setting the environment variables from `set_env_variables.sh` manually.

- **User permissions:** The container creates a sudo user matching your host machine's username, UID, and GID. This prevents permission issues when reading/writing files.

- **Git integration:** Your `~/.ssh` folder and `~/.gitconfig` are mounted read-only in the container for git operations. If these don't exist on your host, remove the related volumes from `compose.yaml`.

- **NVIDIA driver compatibility:** If using GPU features, you may need to update the NVIDIA image version in the Dockerfile based on your driver version. See: <https://docs.nvidia.com/deploy/cuda-compatibility/>

---

## Project Structure

```text
.
├── src/                  # Source code (your library/package)
├── apps/                 # Application entry points and scripts
│   └── configs/          # Application configuration files
├── tests/                # Test suite
├── docker/               # Docker configuration files
│   ├── Dockerfile
│   ├── compose.yaml
│   └── *.sh              # Helper scripts
├── install_scripts/      # System setup scripts
├── .github/              # GitHub governance and workflow files
├── .pre-commit-config.yaml
├── pyproject.toml        # Project and tool configuration
├── requirements.txt
└── Makefile
```

---

## Pre-commit Hooks

This template includes a comprehensive set of pre-commit hooks:

| Category | Tools | Purpose |
|----------|-------|---------|
| **Core Hygiene** | pre-commit-hooks | Trailing whitespace, EOF fixes, YAML/TOML/JSON validation, merge conflict detection, private key detection |
| **Python Linting** | Ruff | Fast linting and auto-formatting (replaces Black, isort, Flake8) |
| **Type Checking** | Mypy | Static type analysis |
| **Security** | Bandit | Security vulnerability scanning |
| **Docstrings** | Docformatter | Auto-format docstrings |
| **Shell Scripts** | shfmt, ShellCheck | Shell script formatting and linting |
| **Commits** | conventional-pre-commit | Enforce conventional commit messages |
| **Markdown** | markdownlint | Markdown formatting |
| **YAML** | yamllint | YAML validation |

Run all hooks manually:

```bash
pre-commit run --all-files
```

---

## Project Governance Files

These files establish norms, processes, and expectations for contributors and maintainers. Customize as needed for your project scope.

| File | Purpose | Customization |
|------|---------|---------------|
| `CONTRIBUTING.md` | How to submit code, report bugs, propose features | **Must be tailored** to your workflow |
| `CODE_OF_CONDUCT.md` | Behavioral standards for participants | Generally reusable |
| `SECURITY.md` | Instructions for reporting vulnerabilities | Typically reusable |
| `CHANGELOG.md` | Notable changes per release ([Keep a Changelog](https://keepachangelog.com/)) | **Must be maintained** |
| `SUPPORT.md` | Help channels (issues, forums, etc.) | **Must be customized** |
| `GOVERNANCE.md` | Decision-making processes and roles | For large/enterprise projects; may be removed for personal use |
