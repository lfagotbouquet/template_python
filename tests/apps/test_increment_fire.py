"""Tests for the increment function."""

import subprocess
from pathlib import Path

apps_directory_path = Path(__file__).parents[2] / "apps"


def test_increment_fire() -> None:
    """Test the increment_fire.py script."""
    command = f"python {apps_directory_path / 'increment_fire.py'} --x 2"
    res = int(subprocess.check_output(command, shell=True))
    assert res == 3
