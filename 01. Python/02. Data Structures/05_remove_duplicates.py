"""
1. Remove Duplicates
Problem

Given a list of integers, remove duplicate values while preserving the original order of the elements.

Example
Input:
[4, 2, 4, 1, 2, 7, 1, 9]

Output:
[4, 2, 1, 7, 9]

Requirements:
Preserve the original order.
Do not sort the list.
Return a new list.
Aim for O(n) time complexity.
Use additional space if required.
"""

def remove_duplicates(lst):
    # unique = list(set(lst))

    unique = []
    seen = set()
    for item in lst:
        if item not in seen:
            unique.append(item)
            seen.add(item)

    return unique

print(remove_duplicates([4, 2, 4, 1, 2, 7, 1, 9]))
