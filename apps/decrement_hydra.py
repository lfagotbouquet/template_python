"""Sample app decrementing a given number using Hydra to handle CLI."""

import hydra

from PROJECT_NAME.add import add


def decrement(x: int) -> int:
    """Return the decrement of a given value.

    Args:
        x (int): value to be decremented

    Returns:
        int: The decremented value 'x-1'
    """
    return add(x, -1)


@hydra.main(version_base=None, config_path="configs", config_name="decrement")
def main(config):
    result = decrement(config.value)
    print(result)


if __name__ == "__main__":
    main()
