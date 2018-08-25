##Sets

###Set Creation

To create an empty set:

	A = Set()

To create a set initialized with a table of elements:

	B = Set({red, green, blue, white})

This form also works:

	C = Set{red, green, blue, white}

### Set Arithmetic Operations
Given two sets A and B the following arithmetic operations yield a new set...

A + B

#### Mixing Variable Types with Set Arithmetic Operations
The set class handles up converting variable types from table, string, number to set. 

For example, where A is a previously defined set, the following is legal:

	D = A + 77

the 77 is up converted to Set{77} before the union operation is done.

The following are all legal syntaxes:

	D = {red, white} + A
      D = A - 3.14

Note that for this to work, one of the operands must be a Set.

### Set Relational Operations

### Set Unary Operations

To test if set a is the empty set:

	-A

this will return true if set a is empty.

To determine the length of set A:

	#A

this will return the integer length of set A.