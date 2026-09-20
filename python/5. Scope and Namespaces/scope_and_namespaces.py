"""
5. Scope and Namespaces
Learn:

Local scope
Global scope
Enclosing scope
Built-in scope
LEGB rule
global
nonlocal
Understand variable lookup and closures.

"""

# Examples demonstrating Python scopes and namespaces (LEGB)

GLOBAL_VAR = "global value"

def local_scope_example():
	local_var = "local value"
	print("Inside local_scope_example: local_var=", local_var)


def global_scope_example():
	# reads global variable
	print("Inside global_scope_example: GLOBAL_VAR=", GLOBAL_VAR)


def modify_global_example():
	global GLOBAL_VAR
	GLOBAL_VAR = "modified global"
	print("Inside modify_global_example: GLOBAL_VAR modified to=", GLOBAL_VAR)


def enclosing_scope_example():
	enclosed = "enclosed value"

	def inner():
		# enclosing scope read
		print("Inside inner (enclosing read): enclosed=", enclosed)

	def inner_modify():
		nonlocal enclosed
		enclosed = "modified enclosed"
		print("Inside inner_modify (nonlocal write): enclosed=", enclosed)

	inner()
	inner_modify()
	inner()


def closure_example(multiplier):
	# returns a function that closes over 'multiplier'
	def multiply(x):
		return x * multiplier

	return multiply


def builtin_scope_example():
	# "len" is a built-in
	seq = [1, 2, 3]
	print("Builtin len(seq)=", len(seq))


def legb_demo():
	print("--- LEGB demo start ---")
	local_scope_example()
	global_scope_example()
	modify_global_example()
	global_scope_example()
	enclosing_scope_example()

	doubler = closure_example(2)
	tripler = closure_example(3)
	print("closure doubler(5)=", doubler(5))
	print("closure tripler(5)=", tripler(5))

	builtin_scope_example()
	print("--- LEGB demo end ---")


if __name__ == "__main__":
	legb_demo()
