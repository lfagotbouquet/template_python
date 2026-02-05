"""Sample app decrementing a given number using Hydra to handle CLI."""

import hydra
from omegaconf import DictConfig

from template_project.add import add


def decrement(x: int) -> int:
    """
    Return the decrement of a given value.

    Args:
        x (int): value to be decremented

    Returns:
        int: The decremented value 'x-1'

    """
    return add(x, -1)


@hydra.main(version_base=None, config_path="configs", config_name="decrement")
def main(config: DictConfig) -> None:
    """
    Decrement the given value from config and print the result.

    Args:
        config: Hydra config object with 'value' attribute

    """
    result = decrement(config.value)
    print(result)  # noqa: T201


if __name__ == "__main__":
    main()
