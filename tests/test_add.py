"""Tests for the add function."""

from template_project.add import add


def test_add() -> None:
    """Test of the add module."""
    assert add(0, 1) == 1
