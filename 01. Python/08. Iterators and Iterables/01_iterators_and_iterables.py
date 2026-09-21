"""
8. Iterators and Iterables
Very important for Data Engineering.

Topics:
- Iterable
- Iterator
- iter()
- next()
- StopIteration
- How `for item in data` works internally
"""

# Iterable: an object that can return an iterator.
# Examples: list, tuple, string, dict, set, generator, custom class.

numbers = [10, 20, 30]
print("Iterable example:", numbers)

# 1) iter() creates an iterator from an iterable
iterator = iter(numbers)
print("Iterator object:", iterator)
print("First item via next():", next(iterator))
print("Second item via next():", next(iterator))
print("Third item via next():", next(iterator))

# Calling next() after the end raises StopIteration
try:
    print(next(iterator))
except StopIteration:
    print("StopIteration: no more items to read")

# 2) The for-loop does this internally:
#    it calls iter(data), then repeatedly calls next(iterator)
#    until StopIteration is raised.
print("\nFor-loop internal behavior:")
for item in numbers:
    print("-", item)

# Example of manual iteration using while loop to mirror for-loop behavior
print("\nManual iteration equivalent:")
manual_iterator = iter(numbers)
while True:
    try:
        value = next(manual_iterator)
    except StopIteration:
        print("Reached end of the iterator")
        break
    print("-", value)

# 3) Strings are iterable
name = "Alice"
print("\nString iteration:")
for ch in name:
    print(ch)

# 4) A custom iterator class
class Countdown:
    def __init__(self, start):
        self.current = start

    def __iter__(self):
        return self

    def __next__(self):
        if self.current < 0:
            raise StopIteration
        value = self.current
        self.current -= 1
        return value

print("\nCustom iterator example:")
for x in Countdown(3):
    print(x)

# 5) Generators are iterators too
print("\nGenerator example:")
def square_numbers(n):
    for i in range(n):
        yield i * i

for sq in square_numbers(5):
    print(sq)

# Summary:
# - Iterable: can produce an iterator via iter(obj)
# - Iterator: keeps state and produces next value via next(iterator)
# - StopIteration: signals there are no more values
# - for loops use iter() and next() behind the scenes
