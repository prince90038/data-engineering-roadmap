"""
Problem

Given a list of elements, count how many times each element occurs and return the frequency of each element.

Example
Input:
["apple", "banana", "apple", "orange", "banana", "apple"]

Output:
{
    "apple": 3,
    "banana": 2,
    "orange": 1
}

Requirements:
Count every unique element.
Return the result as a dictionary.
Aim for O(n) time complexity.
"""

# from collections import defaultdict

# def frequency_counter(lst):

#     frequency = defaultdict(int)
#     for item in lst:
#         frequency[item] += 1

#     return dict(frequency)

# print(frequency_counter(["apple", "banana", "apple", "orange", "banana", "apple"]))

from collections import Counter

def frequency_counter(lst):
    
    frequency = Counter(lst)

    return dict(frequency)

print(frequency_counter(["apple", "banana", "apple", "orange", "banana", "apple"]))
