# Question 1:

Here is a table of 1-5 star ratings for five movies (M, N, P. Q. R) by three raters (A, B, C).

|   | M	| N | P | Q | R |
|:-:|:-:|:-:|:-:|:-:|:-:|
| A | 1	| 2 | 3 | 4 | 5 |
| B | 2 | 3 | 2 | 5 | 3 |
| C | 5 | 5 | 5 | 3 | 2 |

Normalize the ratings by subtracting the average for each row and then subtracting the average for each column in the resulting table. Then, identify the true statement 
about the normalized table.

**Resp:** There are more 0's than 1's.

False ones:

- The smallest element is (A,M).
- The entry (A,Q) is -3.
- The largest element is (B,Q). 

# Question 2:

Below is a table giving the profile of three items.

|   |  	|   |   |   |   |   |
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
| A | 1 | 0 | 1 | 0 | 1 | 2 |
| B | 1 | 1 | 0 | 0 | 1 | 6 |
| C | 0 | 1 | 0 | 1 | 0 | 2 |

The first five attributes are Boolean, and the last is an integer "rating." Assume that the scale factor for the rating is α. Compute, as a function of α, the cosine distances between each pair of profiles. For each of α = 0, 0.5, 1, and 2, determine the cosine of the angle between each pair of vectors. Which of the following is FALSE?

**Resp:** For α = 2, A is closer to C than B is.

False ones:

- For α = 1, C is closer to B than A is.
- For α = 1, B is closer to A than C is.
- For α = 0.5, A is closer to B than C is.


# Question 3:

Below is a utility matrix representing ratings by users A, B, and C for items a through h.


|   | a	| b | c | d | e | f | g | h |
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
| A | 4 | 5 | - | 5 | 1 | - | 3 | 2 |
| B | - | 3 | 4 | 3 | 1 | 2 | 1 | - |
| C | 2 | - | 1 | 3 | - | 4 | 5 | 3 |

Treat ratings of 3, 4, and 5 as 1 and 1, 2, and blank as 0. Compute the Jaccard distance between each pair of items. Then, cluster the items hierarchically into four clusters, using the Jaccard distance. When a cluster consists of more than one item, take the distance between clusters to be the minimum over all pairs of items, one from each cluster, of the Jaccard distance between those items. Break ties lexicographically. That is, sort the items that would be merged alphabetically, and merge those clusters whose resulting set would be first alphabetically. Then, identify one of the resulting clusters in the list below.

Note: if you are not familiar with hierarchical clustering, you might want to wait until Video 59 in Week 5, or read Sect. 7.2 of the MMDS book.

**Resp:** {e}

False ones:

- {b,d,g}
- {d,g}
- {g}

# Question 4:

We want to do an approximate UV-decomposition of the matrix M =

|   |   |   |
|:-:|:-:|:-:|
| 1 | 2 | 3 |
| 4 | 5 | 6 |
| 7 | 8 | 9 |

We shall use only a single column for U and a single row for V, so the goal is to make the product UV as close as possible to M. Initially, we shall set V to [5,5,5] and make the entries of U unknown. Then in the first step, we choose the values of x, y, and z that minimize the root-mean-square error (RMSE) between the product

|   |
|:-:|
| x |
| y |
| z |

|   |   |   |
|:-:|:-:|:-:|
| 5 | 5 | 5 |

and the matrix M.

Find the values of x, y, and z that minimize the RMSE and identify one of those values below.

**Resp:** y = 1.

False ones:

- y = 2/3.
- y = 5.
- x = 2.



# Question 1:

Note: In this question, all columns will be written in their transposed form, as rows, to make the typography simpler. Matrix M has three rows and three columns, and the columns form an orthonormal basis. One of the columns is [2/7,3/7,6/7], and another is [6/7, 2/7, -3/7]. Let the third column be [x,y,z]. Since the length of the vector [x,y,z] must be 1, there is a constraint that x^2+y^2+z^2 = 1. However, there are other constraints, and these other constraints can be used to deduce facts about the ratios among x, y, and z. Compute these ratios, and then identify one of them in the list below.


**Resp:** y = -2x

orthonomal cols, their dot product is equals to 0 => col(i) * col(j) == 0, for i != j

c1 = [2/7,3/7,6/7], c2 = [6/7, 2/7, -3/7], c3 = [x,y,z]

c1 * c2 = 2/7 * 6/7 + 3/7 * 2/7 + 6/7 * -3/7 = 0

c1 * c3 = 2/7 * x + 3/7 * y + 6/7 * z

c2 * c3 = 6/7 * x + 2/7 * y - 3/7 * z

Equation: c1 * c3 == c2 * c3

2/7 * x + 3/7 * y + 6/7 * z = 0;
2x + 3y + 6z = 0;
x + 3/2y + 3z = 0; # eq1' divide by 2
1/3x + 1/2y + z = 0; # eq1'' divide by 6

6/7 * x + 2/7 * y - 3/7 * z = 0;
6x + 2y - 3z = 0;
x + 1/3y - 1/2z = 0; # eq2' divide by 6
2x + 2/3y - z = 0; # eq2'' divide by 3

eq1' minus eq2'

(3/2 - 1/3) * y + (3 - 1/2) z = 0;
(7/6) * y + (5/2) z = 0;
7/6y = -5/2z;

y = -30/14*z;
z = -14/30*y;


eq1'' plus eq2''

(1/3 + 2) * x + (1/2 + 2/3) * y = 0;
14/6x + 7/6y = 0;
14x + 7y = 0;
y = -2x;
x = -1/2y;

False ones:

- y = 3z
- z = -3y
- x = 2y


# Question 2:

Find the eigenvalues and eigenvectors of the following matrix:

|   |    |
|:-:|:--:|
| 2 | 3  |
| 3 | 10 |


You should assume the first component of an eigenvector is 1. Then, identify one of these in the list below.

**Resp:**  One eigenvector is

|   |
|:-:|
| 1 |
| 3 |


False ones:

- One eigenvector is

|    |
|:--:|
| 1  |
| 11 |

- One eigenvector is

|   |
|:-:|
| 1 |
| 2 |

- One eigenvalue is 10.

# Question 3:

Suppose [1,3,4,5,7] is an eigenvector of some matrix. What is the unit eigenvector in the same direction? Find one of the components of the unit eigenvector in the list below (correct to two decimal places).

**Resp:** 0.10

False ones: 0.28  0.36  0.15

# Question 4:

Suppose we have three points in a two dimensional space: (1,1), (2,2), and (3,4). We want to perform PCA on these points, so we construct a 2-by-2 matrix, call it N, whose eigenvectors are the directions that best represent these three points. Construct the matrix N and identify, in the list below, one of its elements.

**Resp:** 21

False ones: 19  23  22

# Question 5:

Consider the diagonal matrix M =

|   |   |   |
|:-:|:-:|:-:|
| 1 | 0 | 0 |
| 0 | 2 | 0 |
| 0 | 0 | 0 |

Compute its Moore-Penrose pseudoinverse, and then identify, in the list below, the true statement about the elements of the pseudoinverse.

**Resp:** There is one element with value 1.

False ones:

- There is one element with value -1. 
- There is one element with value 0.
- There is one element with value infinity. 

# Question 6:

When we perform a CUR dcomposition of a matrix, we select rows and columns by using a particular probability distribution for the rows and another for the columns. Here is a matrix that we wish to decompose:

|    |    |    |
|:--:|:--:|:--:|
| 1  | 2  | 3  |
| 4  | 5  | 6  |
| 7  | 8  | 9  |
| 10 | 11 | 12 | 

Calculate the probability distribution for the rows, and then identify the correct probability (correct to three decimal places) for one of the rows in the list below.

**Resp:** The probability of selecting row 4 is 0.562. 

False ones:

- The probability of selecting row 3 is 0.250.
- The probability of selecting row 1 is 0.147.
- The probability of selecting row 1 is 0.002.

