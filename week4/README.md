# Question 1:

Here is a table of 1-5 star ratings for five movies (M, N, P. Q. R) by three raters (A, B, C).

|   | M	| N | P | Q | R |
| - |:-:|:-:|:-:|:-:|:-:|
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
| - |:-:|:-:|:-:|:-:|:-:|:-:|
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
| - |:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
| A | 4 | 5 | - | 5 | 1 | - | 3 | 2 |
| B | - | 3 | 4 | 3 | 1 | 2 | 1 | - |
| C | 2 | - | 1 | 3 | - | 4 | 5 | 3 |

Treat ratings of 3, 4, and 5 as 1 and 1, 2, and blank as 0. Compute the Jaccard distance between each pair of items. Then, cluster the items hierarchically into four clusters, using the Jaccard distance. When a cluster consists of more than one item, take the distance between clusters to be the minimum over all pairs of items, one from each cluster, of the Jaccard distance between those items. Break ties lexicographically. That is, sort the items that would be merged alphabetically, and merge those clusters whose resulting set would be first alphabetically. Then, identify one of the resulting clusters in the list below.

Note: if you are not familiar with hierarchical clustering, you might want to wait until Video 59 in Week 5, or read Sect. 7.2 of the MMDS book.

**Resp:**

- {b,d,g}
- {d,g}
- {e}
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
