#!/bin/bash

set -e

# Pyenv install
if pyenv --version >/dev/null 2>&1; then
    echo "Found existing pyenv installation."
else
    echo "pyenv not found, installing it..."

    curl https://pyenv.run | bash

    echo '' >> ~/.bashrc
    echo '# pyenv initialization' >> ~/.bashrc
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
    echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(pyenv init -)"'>> ~/.bashrc
fi

# Activate pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Local virtual env creation
([[ -d $PYENV_ROOT/versions/3.11.9 ]] || pyenv install 3.11.9) && pyenv local 3.11.9 && python -m venv .venv && pyenv local --unset

# Activate virtual env
source .venv/bin/activate

# Python dependencies
pip install -r requirements.txt

# Install project package in editable mode
pip install -e .

# Precommit install
pre-commit install && pre-commit install-hooks
