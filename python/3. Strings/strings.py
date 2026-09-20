# String operations examples

# 1. Creating strings
name = "Alice"
message = 'Hello, world!'

# 2. String concatenation
full_message = message + " " + name
print(full_message)  # Hello, world! Alice

# 3. String length
print(len(name))  # 5

# 4. Indexing and slicing
print(name[0])      # A
print(name[1:4])    # lic
print(name[:3])     # Ali
print(name[-2:])    # ce

# 5. Common string methods
text = "  python is fun  "
print(text.strip())                 # python is fun
print(text.upper())                 #   PYTHON IS FUN  
print(text.lower())                 #   python is fun  
print(text.title())                 #   Python Is Fun  
print(text.replace("fun", "awesome"))

# 6. Splitting and joining
sentence = "Python is easy to learn"
words = sentence.split()
print(words)  # ['Python', 'is', 'easy', 'to', 'learn']
print("-".join(words))  # Python-is-easy-to-learn

# 7. Checking content
email = "user@example.com"
print(email.startswith("user"))  # True
print(email.endswith(".com"))    # True
print("@" in email)               # True
print(email.find("example"))      # 5

# 8. Formatting strings
age = 25
print(f"My name is {name} and I am {age} years old.")
print("My name is {} and I am {} years old.".format(name, age))

# 9. Escape characters
quote = "She said, \"Python is great!\""
print(quote)

# 10. Multiline strings
poem = """Python
is
fun"""
print(poem)
