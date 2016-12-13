# Question 2

Natural join *R(A, B)* with *S(B, C)*

*The Map Function*: For each tuple (a, b) of R, produce the key-value pair [b, (R, a)]. For each tuple (b, c) of S, produce the key-value pair [b, (S, c)].

R	
A		B
0		1
1		2
2		3

[1, (R, 0)]
[2, (R, 1)]
[3, (R, 2)]

S	
B		C
0		1
1		2
2		3

[0, (S, 1)]
[1, (S, 2)]
[2, (S, 3)]


*The Reduce Function*: Each key value b will be associated with a list of pairs that are either of the form (R, a) or (S, c).
Construct all pairs consisting of one with first component R and the other with first component S, say (R, a) and (S, c).

(0, [(S, 1)])
(1, [(R, 0), (S, 2)])
(2, [(R, 1), (S, 3)])
(3, [(R, 2)])

The output from this key and value list is a sequence of key-value pairs.
The key is irrelevant. Each value is one of the triples (a, b, c) such that (R, a) and (S, c) are on the input list of values.

**Resp:** (1, [(R,0), (S,2)])

False ones:

- (1, [(1,(R,0)), (1,(S,2))])
- (3, [(3,(R,2))])
- (1,(S,2))


# Question 3

M have x rows and y columns, while N has y rows and z columns.

1. The output of the first Map function has how many different keys? How many key-value pairs are there with each key? How many key-value pairs are there in all?

M(i, j, mij) => (j, (M, i, mij))
N(j, k, njk) => (j, (N, k, njk))

number keys M -> xy
number keys N -> yz
number keys -> xy + yz

2. The output of the first Reduce function has how many keys? What is the length of the value (a list) associated with each key?

For each key j, examine its list of associated values. For each value that comes from M, say (M, i, mij), and each value that comes from N, say (N, k, njk), produce a key-value pair with key equal to (i, k) and value equal to the product of these elements, mij * njk.

((i, k), mij * njk)

number of elements in result matrix -> xz
the calculation of each element of the matrix is done by the sum of y elements (mij * njk + ...)

number keys -> y(xz)
number different keys -> xz

3. The output of the second Map function has how many different keys? How many key-value pairs are there with each key? How many key-value pairs are there in all?

This function is just the identity. That is, for every input element with key (i, k) and value v, produce exactly this key-value pair.

number keys -> y(xz)
number keys -> xz

**Resp:** The output of the second Map function has xz different keys.

False ones:

- The output of the first Reduce function has pairs with lists of length y(x+z).
- The output of the second Map function has y(x+z) pairs.
- The output of the second Map function has xy different keys.


# Question 4

M have x rows and y columns, while N has y rows and z columns.

1. The output of the Map function has how many different keys? How many key-value pairs are there with each key? How many key-value pairs are there in all?

The keys will be pairs (i, k), where i is a row of M and k is a column of N.

For each element mij of M, produce all the key-value pairs (i, k), (M, j, mij) for k = 1, 2, . . ., up to the number of columns of N. Similarly, for each element njk of N, produce all the key-value pairs (i, k), (N, j, njk) for i = 1, 2, . . ., up to the number of rows of M . As before, M and N are really bits to tell which of the two matrices a value comes from.

For each element mij of M (xy) up to the number of columns of N (z) -> (xy)z
For each element njk of N (yz) up to the number of rows of M (x) -> (yz)x

number keys -> (xy)z + (yz)x = 2xyz

2. The input to the Reduce function has how many keys? What is the length of the value (a list) associated with each key?

Each key (i, k) will have an associated list with all the values (M, j, m ij ) and (N, j, n jk ), for all possible values of j.
The Reduce function needs to connect the two values on the list that have the same value of j, for each j. An easy way to do this step is to sort by j the values that begin with M and sort by j the values that begin with N , in separate lists. The jth values on each list must have their third components, m ij and n jk extracted and multiplied. Then, these products are summed and the result is paired with (i, k) in the output of the Reduce function.

**Resp:** The output of the Map function has 2xyz pairs.

False ones:

- The output of the Map function has y(x+z) different keys.
- The input to the Reduce function has pairs with lists of length y.
- The input to the Reduce function has pairs with lists of length 2xz.



