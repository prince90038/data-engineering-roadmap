"""
Learn commonly used dunder methods:

__init__
__str__
__repr__
__len__
__eq__
__lt__
__hash__
__iter__
__next__
__enter__
__exit__
Understand how Python's data model works.
"""


class Person:
    """Demonstrates common dunder methods."""
    
    def __init__(self, name, age):
        """Initialize person with name and age."""
        self.name = name
        self.age = age
    
    def __str__(self):
        """Return user-friendly string representation."""
        return f"{self.name} is {self.age} years old"
    
    def __repr__(self):
        """Return official string representation."""
        return f"Person('{self.name}', {self.age})"
    
    def __len__(self):
        """Return length of name."""
        return len(self.name)
    
    def __eq__(self, other):
        """Check equality based on name and age."""
        return self.name == other.name and self.age == other.age
    
    def __lt__(self, other):
        """Compare by age."""
        return self.age < other.age
    
    def __hash__(self):
        """Make person hashable."""
        return hash((self.name, self.age))


class Counter:
    """Demonstrates __iter__ and __next__ methods."""
    
    def __init__(self, max):
        self.max = max
        self.current = 0
    
    def __iter__(self):
        """Return iterator object."""
        return self
    
    def __next__(self):
        """Return next value."""
        if self.current < self.max:
            self.current += 1
            return self.current
        raise StopIteration


class FileHandler:
    """Demonstrates context manager methods."""
    
    def __init__(self, filename, mode):
        self.filename = filename
        self.mode = mode
        self.file = None
    
    def __enter__(self):
        """Enter context manager."""
        self.file = open(self.filename, self.mode)
        return self.file
    
    def __exit__(self, exc_type, exc_val, exc_tb):
        """Exit context manager."""
        if self.file:
            self.file.close()
        return False


# Examples
if __name__ == "__main__":
    # __init__, __str__, __repr__
    p1 = Person("Alice", 30)
    print(str(p1))
    print(repr(p1))
    
    # __len__
    print(f"Name length: {len(p1)}")
    
    # __eq__, __lt__
    p2 = Person("Bob", 25)
    print(f"p1 == p2: {p1 == p2}")
    print(f"p2 < p1: {p2 < p1}")
    
    # __hash__
    people_set = {p1, p2}
    print(f"Set of people: {people_set}")
    
    # __iter__, __next__
    counter = Counter(3)
    for num in counter:
        print(f"Count: {num}")
    
    # __enter__, __exit__
    with FileHandler("test.txt", "w") as f:
        f.write("Hello, World!")
