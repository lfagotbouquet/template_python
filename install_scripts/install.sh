#!/bin/bash

set -e

# Pyenv install
if pyenv --version >/dev/null 2>&1; then
	echo "Found existing pyenv installation."
else
	echo "pyenv not found, installing it..."

	curl https://pyenv.run | bash

	# Batch append to ~/.bashrc in a single redirect to avoid SC2129
	{
		echo ""
		echo "# pyenv initialization"
		echo "export PYENV_ROOT=\"$HOME/.pyenv\""
		echo "[[ -d \$PYENV_ROOT/bin ]] && export PATH=\"\$PYENV_ROOT/bin:\$PATH\""
		echo "eval \"\$(pyenv init -)\""
	} >>"$HOME/.bashrc"
fi

# Activate pyenv for this script
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Local virtual environment creation
if [[ ! -d "$PYENV_ROOT/versions/3.11.9" ]]; then
	pyenv install 3.11.9
fi
pyenv local 3.11.9
python -m venv .venv
pyenv local --unset

# Activate virtual environment (SC1091 warning is informational; we include -x to allow sourcing)
# shellcheck source=/dev/null
source .venv/bin/activate

# Python dependencies
pip install -r requirements.txt

# Install project package in editable mode
pip install -e .

# Pre-commit install
pre-commit install
pre-commit install-hooks
pre-commit run --all-files
