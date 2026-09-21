"""
Closures in Python

A closure is a function that remembers and can access variables from its 
enclosing (outer) function even after the outer function has finished executing.
"""

def multiplier(n):
    def multiply(x):
        return x * n

    return multiply


double = multiplier(2)
print(double.__closure__[0].cell_contents)
print(double(5)) # 10
print(double(10)) # 20

