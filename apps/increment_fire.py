"""Sample app incrementing a given number using Fire to handle CLI."""

import fire

from template_project.add import add


def increment(x: int) -> int:
    """
    Return the increment of a given value.

    Args:
        x (int): value to be incremented

    Returns:
        int: The incremented value 'x+1'

    """
    return add(x, 1)


if __name__ == "__main__":
    fire.Fire(increment)
