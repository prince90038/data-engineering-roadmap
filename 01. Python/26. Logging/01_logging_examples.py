"""
logging_examples.py

Examples demonstrating the `logging` module configuration for
different environments and how to log exceptions and structured messages.
"""

import logging


def configure_logging():
    logging.basicConfig(level=logging.INFO, format="%(asctime)s %(levelname)s %(message)s")


def do_work():
    logging.info("Starting work")
    try:
        1/0
    except Exception:
        logging.exception("Work failed")


if __name__ == "__main__":
    configure_logging()
    do_work()
