"""
3. First Non-Repeating Character
Problem

Given a string, find the first character that appears only once in the string.

Return the character. If there is no non-repeating character, return None.

Example
Input:
"swiss"

Output:
"w"

Explanation:

s → 3 times
w → 1 time
i → 1 time

The first character appearing only once is w.

Requirements
Preserve the original order.
Aim for O(n) time complexity.
Handle an empty string.
"""

from collections import defaultdict

def first_non_repeating_character(st):
    freq = defaultdict(int)

    if st == '':
        return ''

    for ch in st:
        freq[ch] += 1

    for key, value in freq.items():
        if value == 1:
            return key

    return ''

print(first_non_repeating_character("swiss"))
