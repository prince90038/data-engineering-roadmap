"""
4. Group Anagrams
Problem

Given a list of strings, group all strings that are anagrams of each other.

Two strings are anagrams if they contain the same characters with the same frequencies.

Example
Input:
["eat", "tea", "tan", "ate", "nat", "bat"]

Output:
[
    ["eat", "tea", "ate"],
    ["tan", "nat"],
    ["bat"]
]

The order of groups does not matter.

Requirements
Group all anagrams together.
Aim for better than O(n²) time complexity.
Handle strings with different lengths.
"""

from collections import defaultdict

def group_anagrams(lst):
    group_dict = defaultdict(list)

    # for item in lst:
    #     group_dict[''.join(sorted(item))].append(item)

    for item in lst:
        freq = [0]*26

        for ch in item:
            freq[ord(ch) - ord('a')] += 1

        group_dict[tuple(freq)].append(item)

    output = list(group_dict.values())

    return output



print(group_anagrams(["eat", "tea", "tan", "ate", "nat", "bat"]))
