##Sets

The Set class has only one API call, the constructor, as in:

	A = Set({3,4,5})

which creates a Set referenced by variable A that contains 3, 4, and 5.

To create an empty set:

	A = Set()

or

	A = Set({})


Also, just using the curly brackets without the parentheses also works:

	C = Set{'red', 'green', 'blue', 'white'}

All other set manipulations occur by using various *operator symbols* between two different sets, or using the unary operator symbols on a single set as described below.

### Set Operations

The following symbolic set operators can be used between two Sets, the result of which returns a third set...

| Set Operator | Result Description                                          |
|-------------|---------------------------------------------------------|
|     +        |  The **union** of two sets, as in C = A + B.
|      *         | The **intersection** of two sets, as in C = A * B
|      -         | The **difference** between two sets, as in C = A - B
|       ^        | The **symmetric difference** between two sets, as in C = A ^ B

All of the above Set Operators support up converting a non-Set operand to a Set operand automatically.

For example, given:

	A = Set(1,2,3}

then the following is legal:

	D = A + 77

The 77 is automatically up converted to Set{77} before the union operation is done.

The following are all legal because of automatic up conversion:

	D = {red, white} * A
      D = A - 3.14
	D = A ^ 'red'

**Note that for this to work, one of the operands must be a Set.**

### Relational Operations

The following symbolic relational operators can be used between two Sets, the result of which returns a boolean...

| Set Operator | Result Description                                          |
|-------------|---------------------------------------------------------|
|  ==          |  Returns true the two sets are **equal**, as in A == B
|   %          |  Returns true if the two sets are **disjoint** (have no elements in common), as in A % B
|   <           |  Returns true if the first set is a **subset** of the second set, as in A > B
|   >           |  Returns true if the first set **contains** the second set, as in B > A


### Unary Operations

The following symbols can be used a prefix to a Set variable as follows...

| Set Operator | Result Description                                          |
|-------------|---------------------------------------------------------|
|  #            | Returns the **number of elements** in the set or the **length** of the set, as in #A
|  -            | Returns true if the set is **empty**, as in -A

### Support for Converting a Set to a String

The Set class supports implicit and manual conversion of a Set to string.

For example, whenever a set is required to implicitly be represented as a string, as in:

	A = Set{1,2,3}
	print(A)

or whenever a set needs to be manually converted into a string, as in:

	B = Set{'blue', 43, 'green', 3.14}
	B_string = tostring(B)

The Set is automatically converted into a string representation.

### Set Concatenation

The Lua string concatenation symbol, **..**, can be used to concatenate a Set with another Set, as in,

	A = Set{1,2,3}
	B = Set{'red'}
	str = A .. B

or a Set with another string as in:

	B = Set{'red'}
	str = "Set B is: " .. B


