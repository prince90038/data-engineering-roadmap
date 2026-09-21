"""
Higher-Order Functions in Python

A higher-order function is a function that does at least one of these:

Takes another function as an argument
Returns another function

Python supports this because functions are first-class objects.
"""

# 1. Function passed as an argument
def square(x):
    return x * x

def apply_function(func, value):
    return func(value)

result = apply_function(square, 5)

print(result) # Output: 25

# 2. Function returning another function
def multiplier(n):
    def multiply(x):
        return x * n

    return multiply

double = multiplier(2)

print(double(5)) # Output: 10

# 3. Built-in higher-order functions
numbers = [1, 2, 3, 4]

result = list(map(lambda x: x * 2, numbers))

print(result) # Output: [2, 4, 6, 8]
