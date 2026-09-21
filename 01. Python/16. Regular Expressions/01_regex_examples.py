"""
regex_examples.py

Examples for common regex tasks: finding, matching, extracting, and
replacing patterns in text for data cleaning and parsing.
"""

import re
from typing import List


def extract_emails(text: str) -> List[str]:
    pattern = r"[\w\.-]+@[\w\.-]+\.[a-zA-Z]{2,6}"
    return re.findall(pattern, text)


def split_on_non_alnum(text: str):
    return re.split(r"[^0-9A-Za-z]+", text)


if __name__ == "__main__":
    sample = "Contact: alice@example.com, bob@company.org"
    print(extract_emails(sample))
    print(split_on_non_alnum("abc,123;xyz"))
