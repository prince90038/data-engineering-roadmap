# Python for Data Engineering

## Objective

Build strong Python skills required for:

- Python Data Engineer roles
- AWS Data Engineer roles
- Data pipeline development
- ETL / ELT development
- PySpark
- APIs and backend services
- Automation
- Data validation
- Production-grade data processing
- Technical interviews

The focus is **not** on learning Python from scratch. The goal is to become strong enough to write clean, efficient, testable, production-quality Python for Data Engineering.

---

# 1. Python Fundamentals

## 1.1 Data Types

Learn:

- `int`
- `float`
- `str`
- `bool`
- `None`
- `list`
- `tuple`
- `set`
- `dict`
- `bytes`

Understand:

- Mutable vs immutable objects
- Hashable vs unhashable objects
- Object identity vs equality
- Type conversion
- Truthy and falsy values

### Practice

```python
x = [1, 2, 3]
y = x
y.append(4)

print(x)
print(y)
```

Understand why both variables contain the modified list.

---

# 2. Data Structures

Data structures are extremely important for Data Engineering and interviews.

## Learn

### Lists

- Indexing
- Slicing
- List methods
- List comprehensions
- Nested lists

### Tuples

- Immutability
- Tuple unpacking
- Named tuples

### Sets

- Uniqueness
- Union
- Intersection
- Difference
- Membership testing

### Dictionaries

- Key/value operations
- Dictionary comprehensions
- `get()`
- `items()`
- `keys()`
- `values()`
- `defaultdict`
- `Counter`

### Practice Problems

Implement:

- Remove duplicates
- Frequency counter
- First non-repeating character
- Group anagrams
- Two sum
- Find duplicate records
- Merge two dictionaries
- Find common elements between datasets

---

# 3. Strings

Learn:

- String slicing
- Formatting
- f-strings
- `split()`
- `join()`
- `replace()`
- `strip()`
- `startswith()`
- `endswith()`
- Regular expressions

## Data Engineering Use Cases

Practice processing:

```text
CSV data
Log files
JSON strings
URLs
File paths
Error messages
Kafka messages
```

---

# 4. Functions

Learn:

- Function definition
- Parameters
- Return values
- Default arguments
- Keyword arguments
- Positional arguments
- `*args`
- `**kwargs`
- Lambda functions
- Higher-order functions
- Closures

## Important

Understand the difference between:

```python
def func(items=[]):
    ...
```

and:

```python
def func(items=None):
    if items is None:
        items = []
```

Understand why mutable default arguments can cause bugs.

---

# 5. Scope and Namespaces

Learn:

- Local scope
- Global scope
- Enclosing scope
- Built-in scope
- LEGB rule
- `global`
- `nonlocal`

Understand variable lookup and closures.

---

# 6. Object-Oriented Programming

OOP is important for production Python.

## Learn

- Classes
- Objects
- Constructors
- Instance attributes
- Class attributes
- Instance methods
- Class methods
- Static methods
- Inheritance
- Encapsulation
- Polymorphism
- Abstraction
- Composition

## Important Interview Topics

Understand:

- `self`
- `super()`
- Method Resolution Order (MRO)
- Multiple inheritance
- Abstract Base Classes
- Dataclasses
- Properties

### Practice

Build classes such as:

```text
DataPipeline
DataSource
DataValidator
DataTransformer
DataLoader
```

---

# 7. Python Special Methods

Learn commonly used dunder methods:

```python
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
```

Understand how Python's data model works.

---

# 8. Iterators and Iterables

Very important for Data Engineering.

Learn:

- Iterable
- Iterator
- `iter()`
- `next()`
- `StopIteration`

Understand:

```python
for item in data:
    ...
```

and what happens internally.

---

# 9. Generators

Generators are particularly useful when processing large datasets.

Learn:

- `yield`
- Generator functions
- Generator expressions
- Lazy evaluation
- Memory efficiency

Example:

```python
def read_large_file(path):
    with open(path) as file:
        for line in file:
            yield line
```

Understand why this is better than loading the entire file into memory.

---

# 10. Decorators

Learn:

- Functions as objects
- Nested functions
- Closures
- Decorators
- Decorators with arguments
- `functools.wraps`

Practice creating decorators for:

- Logging
- Execution time
- Retry
- Authentication
- Validation

Example:

```python
@log_execution_time
def process_data():
    ...
```

---

# 11. Context Managers

Learn:

- `with`
- `__enter__`
- `__exit__`
- `contextlib.contextmanager`

Understand why context managers are useful for:

- Files
- Database connections
- Locks
- Transactions
- Resources

Example:

```python
with open("data.txt") as file:
    data = file.read()
```

---

# 12. Exception Handling

Learn:

```python
try
except
else
finally
raise
```

Also learn:

- Custom exceptions
- Exception chaining
- Logging exceptions
- When to catch exceptions
- When not to catch exceptions

### Data Engineering Focus

Understand how to handle:

- Bad records
- Network failures
- Database failures
- API failures
- Invalid schemas
- Missing files
- Serialization errors

---

# 13. File Handling

Learn:

- Reading files
- Writing files
- Append mode
- Binary files
- Encoding
- File paths
- Directory operations

Use:

```python
pathlib
```

instead of relying only on string-based paths.

### Practice With

- CSV
- JSON
- JSON Lines
- TXT
- Parquet
- Log files

---

# 14. JSON

Learn:

```python
json.loads()
json.dumps()
json.load()
json.dump()
```

Understand:

- Serialization
- Deserialization
- Nested JSON
- JSON validation
- JSON normalization

Practice converting:

```text
API response
      ↓
JSON
      ↓
Python objects
      ↓
DataFrame
```

---

# 15. CSV Processing

Learn:

- `csv` module
- Reading CSV
- Writing CSV
- Headers
- Delimiters
- Quoting
- Missing values
- Large CSV files

Practice processing a large CSV without loading the entire file into memory.

---

# 16. Regular Expressions

Learn the basics of:

- Character classes
- Quantifiers
- Groups
- Capturing groups
- Lookahead
- Lookbehind
- `re.search`
- `re.match`
- `re.findall`
- `re.sub`

Use cases:

- Log parsing
- Data cleaning
- Validation
- Extracting IDs
- Parsing timestamps

Don't overuse regex when normal string operations are simpler.

---

# 17. Modules and Packages

Learn:

- Modules
- Packages
- Imports
- Relative imports
- `__init__.py`
- `__name__`
- `__main__`

Understand:

```python
if __name__ == "__main__":
    main()
```

---

# 18. Virtual Environments and Dependency Management

Learn:

- `venv`
- `pip`
- `requirements.txt`
- Dependency pinning
- Package versions
- Virtual environments

Also become familiar with modern Python dependency management tools such as:

- Poetry
- uv

Understand why reproducible dependencies matter in production.

---

# 19. Type Hints

Type hints are important for maintainable production code.

Learn:

```python
str
int
float
bool
list[str]
dict[str, int]
tuple
Optional
Union
Any
```

Also learn:

- `TypeAlias`
- `TypedDict`
- `Literal`
- `Protocol`
- Generic types

Example:

```python
def process_records(records: list[dict]) -> list[dict]:
    ...
```

---

# 20. Dataclasses

Learn:

```python
from dataclasses import dataclass
```

Understand:

- Immutable dataclasses
- Default values
- `field()`
- `__post_init__`

Use dataclasses for structured internal data models where appropriate.

---

# 21. Pydantic

Useful for APIs, configuration, validation, and structured data.

Learn:

- Models
- Field validation
- Nested models
- Optional fields
- Custom validators
- Serialization
- Deserialization
- Configuration

Practice validating incoming API/data pipeline records.

---

# 22. Functional Programming Concepts

Learn:

- `map`
- `filter`
- `reduce`
- Lambda
- Comprehensions
- `zip`
- `enumerate`
- `any`
- `all`

Don't blindly replace readable loops with functional constructs.

Prioritize readability.

---

# 23. Collections Module

Learn:

```python
Counter
defaultdict
deque
namedtuple
```

Especially understand:

```python
Counter
defaultdict
deque
```

These are useful for data processing and interview problems.

---

# 24. itertools

Learn:

```python
chain
combinations
permutations
product
groupby
islice
```

Useful for efficient data processing and interview problems.

---

# 25. functools

Learn:

```python
reduce
partial
lru_cache
cache
wraps
```

Understand caching and memoization.

---

# 26. Logging

Production data pipelines must have good logging.

Learn:

```python
import logging
```

Understand:

- Log levels
- Logger
- Handler
- Formatter
- File logging
- Console logging
- Structured logging
- Exception logging

Levels:

```text
DEBUG
INFO
WARNING
ERROR
CRITICAL
```

Practice adding useful logs to an ETL pipeline.

---

# 27. Configuration Management

Learn how to manage:

- Environment variables
- Configuration files
- Secrets
- Runtime configuration

Common concepts:

```text
.env
Environment variables
Configuration objects
Secret managers
```

Never hardcode:

```python
API_KEY = "secret"
PASSWORD = "password123"
```

---

# 28. Database Connectivity

Learn Python database interaction.

Start with:

- PostgreSQL
- MySQL

Understand:

- Connection
- Cursor
- Queries
- Parameters
- Transactions
- Commit
- Rollback
- Connection pooling

Learn parameterized queries.

Never build SQL like:

```python
query = f"SELECT * FROM users WHERE id = {user_id}"
```

Prefer parameterized queries.

---

# 29. SQLAlchemy

Learn:

- Engine
- Connection
- Sessions
- Transactions
- Core
- ORM basics
- Connection pooling

Understand when raw SQL is preferable to ORM.

---

# 30. APIs

Learn:

- HTTP fundamentals
- REST
- HTTP methods
- Status codes
- Headers
- Query parameters
- Request body
- Authentication
- Pagination
- Rate limits
- Retries

Python libraries:

```text
requests
httpx
```

Practice:

```text
API
 ↓
JSON
 ↓
Validation
 ↓
Transformation
 ↓
Database
```

---

# 31. Concurrency

Understand the difference between:

```text
Sequential
Threading
Multiprocessing
AsyncIO
```

Learn:

- GIL
- CPU-bound tasks
- I/O-bound tasks
- Thread pools
- Process pools
- Async/await

### Interview Question

When would you use:

```text
Threading?
Multiprocessing?
AsyncIO?
```

---

# 32. AsyncIO

Learn:

- `async`
- `await`
- Event loop
- Coroutines
- Tasks
- `asyncio.gather()`
- Async HTTP requests

Useful for:

- API calls
- Network operations
- I/O-heavy workloads

---

# 33. Multiprocessing

Learn:

- Processes
- Process pools
- CPU-bound workloads
- Inter-process communication

Understand when multiprocessing is better than threading.

---

# 34. Performance and Optimization

This is important for Data Engineering.

Learn:

- Time complexity
- Space complexity
- Big O
- Memory usage
- Profiling
- Lazy evaluation
- Generators
- Efficient data structures
- Batching
- Avoiding unnecessary copies

Tools:

```text
timeit
cProfile
memory_profiler
```

---

# 35. Memory Management

Understand:

- Python objects
- References
- Reference counting
- Garbage collection
- Stack vs heap conceptually
- Shallow copy
- Deep copy
- Memory leaks
- Object lifetime

Practice with large datasets.

Understand why this can be dangerous:

```python
data = huge_dataset
copy = data.copy()
```

---

# 36. Testing

Learn:

- Unit testing
- Integration testing
- Test fixtures
- Mocking
- Parametrization
- Test coverage

Primary tool:

```text
pytest
```

Practice testing:

- Data transformations
- Validators
- API clients
- Database functions
- ETL components

---

# 37. Code Quality

Learn:

- PEP 8
- Clean code
- Naming conventions
- Small functions
- Single responsibility
- Type hints
- Documentation
- Code reviews

Useful tools:

```text
ruff
black
mypy
pre-commit
```

Understand the difference between:

```text
Working code
```

and:

```text
Maintainable production code
```

---

# 38. Git

You should be comfortable with:

```text
clone
branch
checkout
add
commit
push
pull
merge
rebase
stash
reset
revert
cherry-pick
```

Also learn:

- Pull requests
- Merge conflicts
- `.gitignore`
- Git branching strategies

---

# 39. Docker Basics

You don't need deep Docker knowledge initially, but understand:

- Images
- Containers
- Dockerfile
- Volumes
- Networks
- Environment variables
- Docker Compose

Practice containerizing a Python ETL application.

---

# 40. Python + Data Engineering Patterns

Understand common patterns:

## Batch Processing

```text
Input Files
    ↓
Python
    ↓
Validate
    ↓
Transform
    ↓
Load
```

## API Pipeline

```text
REST API
   ↓
Python
   ↓
JSON Validation
   ↓
Transformation
   ↓
Database
```

## File Pipeline

```text
CSV / JSON
   ↓
Python
   ↓
Validation
   ↓
Transformation
   ↓
Parquet
```

## Streaming

```text
Kafka
  ↓
Python Consumer
  ↓
Validation
  ↓
Transformation
  ↓
Storage
```

---

# 41. Data Engineering Python Libraries

Know the purpose of these libraries:

| Library | Purpose |
|---|---|
| Pandas | Data manipulation |
| NumPy | Numerical operations |
| PySpark | Distributed data processing |
| SQLAlchemy | Database access |
| psycopg | PostgreSQL connectivity |
| requests | HTTP requests |
| httpx | HTTP / async HTTP |
| Pydantic | Data validation |
| pytest | Testing |
| pathlib | File paths |
| logging | Application logging |
| json | JSON processing |
| csv | CSV processing |
| re | Regular expressions |
| boto3 | AWS SDK for Python |

You do not need to master all of them immediately.

---

# 42. Interview Preparation

## Python Coding

Practice:

- Reverse string
- Palindrome
- Anagram
- Group anagrams
- First non-repeating character
- Two sum
- Remove duplicates
- Frequency counting
- Top K frequent elements
- Merge intervals
- Flatten nested lists
- Find missing numbers
- Find duplicate records
- Sort custom objects
- Merge dictionaries

---

# 43. Python Interview Questions

Be able to explain:

### Fundamentals

- List vs tuple
- Set vs list
- Dictionary internals
- Mutable vs immutable
- `is` vs `==`
- Shallow copy vs deep copy
- `*args` vs `**kwargs`
- `@staticmethod` vs `@classmethod`
- `__str__` vs `__repr__`

### Advanced

- Iterator vs iterable
- Generator vs normal function
- Decorators
- Closures
- Context managers
- GIL
- Threading vs multiprocessing
- AsyncIO
- Memory management
- Garbage collection
- MRO
- Dependency management

### Data Engineering

- How to process a 100 GB file with Python?
- How do you avoid loading the entire dataset into memory?
- How would you build a Python ETL pipeline?
- How do you handle bad records?
- How do you make a pipeline idempotent?
- How do you implement retries?
- How do you process API pagination?
- How do you handle API rate limits?
- How do you validate incoming data?
- How do you optimize slow Python code?

---

# 44. Practical Projects

Build projects instead of only solving isolated exercises.

## Project 1 — CSV ETL Pipeline

```text
CSV
 ↓
Python
 ↓
Validation
 ↓
Transformation
 ↓
Parquet
```

Requirements:

- Logging
- Error handling
- Configuration
- Unit tests
- Type hints

---

## Project 2 — API Data Pipeline

```text
REST API
   ↓
Python
   ↓
Pydantic Validation
   ↓
Transformation
   ↓
PostgreSQL
```

Implement:

- Pagination
- Retry
- Rate-limit handling
- Logging
- Error handling

---

## Project 3 — Incremental ETL

Build a pipeline that:

```text
Source
 ↓
Identify new/updated records
 ↓
Transform
 ↓
Load
```

Implement:

- Watermark
- Incremental processing
- Idempotency
- Deduplication

---

## Project 4 — Kafka Pipeline

```text
Producer
   ↓
Kafka
   ↓
Python Consumer
   ↓
Validation
   ↓
Transformation
   ↓
Database / File
```

Implement:

- Consumer groups
- Error handling
- Retry
- Dead-letter topic
- Logging

---

## Project 5 — Production-Style ETL

Combine:

```text
Python
+
PostgreSQL
+
PySpark
+
Airflow
+
Docker
```

Build:

```text
Source
 ↓
Airflow
 ↓
Python extraction
 ↓
PySpark transformation
 ↓
Data validation
 ↓
PostgreSQL / Data Warehouse
```

This project becomes the bridge to the AWS section.

---

# 45. Recommended Learning Order

Follow this order instead of randomly jumping between topics.

```text
1. Python Fundamentals
        ↓
2. Data Structures
        ↓
3. Functions
        ↓
4. OOP
        ↓
5. Iterators + Generators
        ↓
6. Decorators + Context Managers
        ↓
7. Exception Handling + Logging
        ↓
8. Files + JSON + CSV
        ↓
9. Type Hints + Dataclasses + Pydantic
        ↓
10. Database Connectivity
        ↓
11. APIs
        ↓
12. Concurrency
        ↓
13. Performance + Memory
        ↓
14. Testing
        ↓
15. Git + Code Quality
        ↓
16. Docker
        ↓
17. Data Engineering Projects
```

---

# 46. Progress Tracker

## Fundamentals

- [ ] Data types
- [ ] Lists
- [ ] Tuples
- [ ] Sets
- [ ] Dictionaries
- [ ] Strings
- [ ] Functions
- [ ] Scope
- [ ] OOP
- [ ] Dunder methods

## Advanced Python

- [ ] Iterators
- [ ] Generators
- [ ] Decorators
- [ ] Context managers
- [ ] Exception handling
- [ ] Modules and packages
- [ ] Type hints
- [ ] Dataclasses
- [ ] Pydantic
- [ ] Collections
- [ ] itertools
- [ ] functools

## Data Engineering Python

- [ ] File handling
- [ ] JSON
- [ ] CSV
- [ ] Regex
- [ ] Logging
- [ ] Configuration
- [ ] Database connectivity
- [ ] SQLAlchemy
- [ ] REST APIs
- [ ] Pagination
- [ ] API retries
- [ ] Rate limiting
- [ ] Data validation

## Performance

- [ ] Big O
- [ ] Profiling
- [ ] Memory management
- [ ] Generators for large datasets
- [ ] Threading
- [ ] Multiprocessing
- [ ] AsyncIO

## Engineering Practices

- [ ] Pytest
- [ ] Mocking
- [ ] Code coverage
- [ ] Ruff
- [ ] Black
- [ ] Mypy
- [ ] Pre-commit
- [ ] Git
- [ ] Docker

## Projects

- [ ] CSV ETL
- [ ] API pipeline
- [ ] Incremental ETL
- [ ] Kafka pipeline
- [ ] Production-style ETL

---

# 47. Definition of Done

Before moving deeper into Data Engineering, I should be able to:

- Write clean Python without relying on tutorials.
- Explain Python internals at an interview level.
- Process large files without loading everything into memory.
- Build a reusable ETL pipeline.
- Connect Python to a database.
- Consume data from REST APIs.
- Handle pagination, retries, and rate limits.
- Validate incoming data.
- Write unit and integration tests.
- Add meaningful logging.
- Use type hints.
- Package a Python application.
- Containerize a Python application.
- Explain threading vs multiprocessing vs AsyncIO.
- Optimize inefficient Python code.
- Use Git confidently.
- Build at least 2 production-style Data Engineering projects.

---

# 48. Next Technologies

Once this Python section is sufficiently complete, move to:

```text
Python
   ↓
SQL
   ↓
ETL / ELT
   ↓
PySpark
   ↓
Data Warehousing
   ↓
Airflow
   ↓
Kafka
   ↓
AWS
```

The objective is not to master every Python feature.

The objective is to become strong at **production Python for Data Engineering**.
