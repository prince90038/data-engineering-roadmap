"""
OOP is important for production Python.

Learn
Classes
Objects
Constructors
Instance attributes
Class attributes
Instance methods
Class methods
Static methods
Inheritance
Encapsulation
Polymorphism
Abstraction
Composition

Important Interview Topics
Understand:
self
super()
Method Resolution Order (MRO)
Multiple inheritance
Abstract Base Classes
Dataclasses
Properties
"""

# ============================================================================
# 1. CLASSES AND OBJECTS
# ============================================================================
class Person:
    """Basic class with constructor and instance attributes."""
    
    def __init__(self, name, age):
        """Constructor (initializer) method."""
        self.name = name
        self.age = age
    
    def introduce(self):
        """Instance method."""
        return f"Hello, I'm {self.name} and I'm {self.age} years old"


# ============================================================================
# 2. CLASS ATTRIBUTES AND INSTANCE ATTRIBUTES
# ============================================================================
class Vehicle:
    """Demonstrates class vs instance attributes."""
    
    # Class attribute (shared by all instances)
    total_vehicles = 0
    
    def __init__(self, brand, model):
        # Instance attributes (unique to each instance)
        self.brand = brand
        self.model = model
        Vehicle.total_vehicles += 1
    
    def info(self):
        return f"{self.brand} {self.model}"


# ============================================================================
# 3. CLASS METHODS AND STATIC METHODS
# ============================================================================
class Calculator:
    """Demonstrates class methods and static methods."""
    
    pi = 3.14159
    
    @classmethod
    def create_from_string(cls, value_str):
        """Class method: works with the class, not instances."""
        value = float(value_str)
        return value
    
    @staticmethod
    def add(a, b):
        """Static method: no access to self or cls."""
        return a + b
    
    @staticmethod
    def multiply(a, b):
        return a * b


# ============================================================================
# 4. INHERITANCE AND SUPER()
# ============================================================================
class Animal:
    """Parent class."""
    
    def __init__(self, name, species):
        self.name = name
        self.species = species
    
    def speak(self):
        return f"{self.name} makes a sound"


class Dog(Animal):
    """Child class inheriting from Animal."""
    
    def __init__(self, name, breed):
        super().__init__(name, "Dog")  # Call parent constructor
        self.breed = breed
    
    def speak(self):
        """Override parent method."""
        return f"{self.name} barks!"
    
    def fetch(self, item):
        """New method specific to Dog."""
        return f"{self.name} fetches the {item}"


# ============================================================================
# 5. MULTIPLE INHERITANCE AND MRO
# ============================================================================
class Flyer:
    """Mixin class for flying ability."""
    
    def fly(self):
        return f"{self.__class__.__name__} is flying"


class Swimmer:
    """Mixin class for swimming ability."""
    
    def swim(self):
        return f"{self.__class__.__name__} is swimming"


class Duck(Animal, Flyer, Swimmer):
    """Multiple inheritance example."""
    
    def __init__(self, name):
        super().__init__(name, "Duck")
    
    def speak(self):
        return f"{self.name} quacks!"


# Check MRO
def show_mro():
    """Method Resolution Order demonstration."""
    print("Duck's MRO:")
    for cls in Duck.__mro__:
        print(f"  - {cls}")


# ============================================================================
# 6. ENCAPSULATION (PRIVATE AND PUBLIC ATTRIBUTES)
# ============================================================================
class BankAccount:
    """Demonstrates encapsulation with private attributes."""
    
    def __init__(self, owner, balance):
        self.owner = owner
        self.__balance = balance  # Private attribute (name mangling)
        self._account_id = None   # Protected attribute (convention)
    
    def deposit(self, amount):
        """Public method to access private attribute."""
        if amount > 0:
            self.__balance += amount
            return f"Deposited ${amount}"
        return "Invalid amount"
    
    def withdraw(self, amount):
        if 0 < amount <= self.__balance:
            self.__balance -= amount
            return f"Withdrew ${amount}"
        return "Insufficient funds"
    
    def get_balance(self):
        """Getter method."""
        return self.__balance
    
    def set_balance(self, amount):
        """Setter method with validation."""
        if amount >= 0:
            self.__balance = amount


# ============================================================================
# 7. PROPERTIES (GETTERS AND SETTERS)
# ============================================================================
class Rectangle:
    """Demonstrates properties using @property decorator."""
    
    def __init__(self, width, height):
        self._width = width
        self._height = height
    
    @property
    def area(self):
        """Read-only property."""
        return self._width * self._height
    
    @property
    def width(self):
        return self._width
    
    @width.setter
    def width(self, value):
        if value <= 0:
            raise ValueError("Width must be positive")
        self._width = value
    
    @property
    def height(self):
        return self._height
    
    @height.setter
    def height(self, value):
        if value <= 0:
            raise ValueError("Height must be positive")
        self._height = value


# ============================================================================
# 8. POLYMORPHISM
# ============================================================================
class Shape:
    """Base class for polymorphic behavior."""
    
    def area(self):
        raise NotImplementedError("Subclass must implement area()")


class Circle(Shape):
    """Circle implementation."""
    
    def __init__(self, radius):
        self.radius = radius
    
    def area(self):
        return 3.14159 * self.radius ** 2


class Square(Shape):
    """Square implementation."""
    
    def __init__(self, side):
        self.side = side
    
    def area(self):
        return self.side ** 2


def calculate_total_area(shapes):
    """Polymorphism in action."""
    total = 0
    for shape in shapes:
        total += shape.area()
    return total


# ============================================================================
# 9. ABSTRACT BASE CLASSES
# ============================================================================
from abc import ABC, abstractmethod


class Vehicle(ABC):
    """Abstract base class."""
    
    @abstractmethod
    def start_engine(self):
        """Abstract method that must be implemented."""
        pass
    
    @abstractmethod
    def stop_engine(self):
        pass


class Car(Vehicle):
    """Concrete implementation of Vehicle."""
    
    def start_engine(self):
        return "Car engine started"
    
    def stop_engine(self):
        return "Car engine stopped"


class Bike(Vehicle):
    """Another concrete implementation."""
    
    def start_engine(self):
        return "Bike engine started"
    
    def stop_engine(self):
        return "Bike engine stopped"


# ============================================================================
# 10. COMPOSITION
# ============================================================================
class Engine:
    """Component class."""
    
    def __init__(self, horsepower):
        self.horsepower = horsepower
    
    def start(self):
        return f"Engine with {self.horsepower} HP started"


class CarWithComposition:
    """Uses composition instead of inheritance."""
    
    def __init__(self, brand, engine):
        self.brand = brand
        self.engine = engine  # Composition
    
    def start(self):
        return f"{self.brand}: {self.engine.start()}"


# ============================================================================
# 11. DATACLASSES
# ============================================================================
from dataclasses import dataclass, field
from typing import List


@dataclass
class Employee:
    """Modern Python dataclass."""
    
    name: str
    employee_id: int
    department: str = "Unknown"
    skills: List[str] = field(default_factory=list)
    
    def add_skill(self, skill):
        self.skills.append(skill)


# ============================================================================
# USAGE EXAMPLES
# ============================================================================
if __name__ == "__main__":
    # Basic class and object
    person1 = Person("Alice", 30)
    print(person1.introduce())
    
    # Class and instance attributes
    car1 = Vehicle("Toyota", "Camry")
    car2 = Vehicle("Honda", "Civic")
    print(f"Total vehicles: {Vehicle.total_vehicles}")
    
    # Static and class methods
    print(f"Addition: {Calculator.add(5, 3)}")
    
    # Inheritance and polymorphism
    dog = Dog("Rex", "Golden Retriever")
    print(dog.speak())
    print(dog.fetch("ball"))
    
    # Multiple inheritance
    duck = Duck("Donald")
    print(duck.speak())
    print(duck.fly())
    print(duck.swim())
    
    # Encapsulation
    account = BankAccount("John", 1000)
    print(account.deposit(500))
    print(f"Balance: ${account.get_balance()}")
    
    # Properties
    rect = Rectangle(5, 10)
    print(f"Rectangle area: {rect.area}")
    rect.width = 7
    print(f"New area: {rect.area}")
    
    # Polymorphism
    shapes = [Circle(5), Square(4)]
    print(f"Total area: {calculate_total_area(shapes)}")
    
    # Abstract classes
    vehicles = [Car(), Bike()]
    for v in vehicles:
        print(v.start_engine())
    
    # Composition
    my_car = CarWithComposition("BMW", Engine(250))
    print(my_car.start())
    
    # Dataclasses
    emp = Employee("Bob", 101, "Engineering")
    emp.add_skill("Python")
    print(emp)

