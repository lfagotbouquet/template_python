# Contributing Guide

Thank you for your interest in contributing to this project.
Contributions are welcome, but please read this document carefully before opening an issue or pull request.

This project prioritizes **code quality, clarity, and long-term maintainability** over rapid feature growth.

---

## Ways to Contribute

You can contribute by:

* Reporting bugs
* Proposing new features or improvements
* Improving documentation
* Submitting code changes
* Reviewing pull requests

Before starting work, please check existing issues and pull requests to avoid duplication.

---

## Development Setup

### Prerequisites

* Python 3.9 or newer
* `uv` (recommended) or `pip`
* `git`

### Clone and Install

```bash
git clone https://github.com/lfagotbouquet/template_python
cd template_python

# Create a virtual environment
uv venv
source .venv/bin/activate

# Install dependencies
uv pip install -r requirements.txt

# Install the project in editable mode
uv pip install -e .

# Install pre-commit hooks
pre-commit install
```

---

## Code Standards

This project enforces strict automated checks.

### Formatting and Linting

* **Ruff** is used for linting and formatting
* Manual formatting is discouraged; rely on tooling instead

Run locally:

```bash
pre-commit run --all-files
```

### Typing

* **Mypy** is used with a strict configuration
* **Bandit** is used to catch early security issues
* New code must include type annotations
* Public APIs must be fully typed

### Tests

* **Pytest** is used for testing
* New features and bug fixes must include tests
* Tests should be deterministic and fast

Run tests with:

```bash
python -m pytest tests/
```

---

## Commit Messages

This project follows **Conventional Commits**. Please read the docs here for more information [DOCS](https://www.conventionalcommits.org/en/v1.0.0/#specification)

Examples:

* `feat: add decrement CLI command`
* `fix: handle empty config file`
* `docs: update installation instructions`
* `refactor: simplify config loading logic`

Pull requests with non-conforming commit messages will be rejected.

---

## Pull Request Guidelines

Before opening a pull request:

* Ensure all pre-commit checks pass
* Ensure tests pass locally
* Keep changes focused and minimal
* Avoid unrelated refactors
* Update documentation where applicable
* Avoid making large PRs as and where possible

Each pull request should:

* Clearly state **what** is changed
* Clearly explain **why** the change is needed
* Reference relevant issues if applicable

---

## Issue Reporting

When reporting bugs, include:

* A clear description of the problem
* Steps to reproduce
* Expected vs actual behavior
* Python version and environment details
* Relevant logs or stack traces

Incomplete or vague issues may be closed without response.

---

## Design Philosophy

This project favors:

* Explicit over implicit behavior
* Simple solutions over clever ones
* Readability over brevity
* Fewer dependencies over convenience

Changes that significantly increase complexity or maintenance burden may be declined.

---

## Code of Conduct

All contributors are expected to follow the project’s
[Code of Conduct](CODE_OF_CONDUCT.md).

---

## Questions

If you are unsure whether a change is appropriate, open an issue **before** starting work.

---

Thank you for contributing.
