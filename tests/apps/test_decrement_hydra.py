"""Tests for the decrement function."""

import subprocess
import tempfile
from pathlib import Path

apps_directory_path = Path(__file__).parents[2] / "apps"


def test_increment_fire() -> None:
    """Test the decrement_hydra.py script."""
    with tempfile.TemporaryDirectory() as tmp_dir:
        command = (
            f"python {apps_directory_path / 'decrement_hydra.py'} "
            "value=2 "
            f"hydra.run.dir={tmp_dir} "
        )
        res = int(subprocess.check_output(command, shell=True))
        assert res == 1
