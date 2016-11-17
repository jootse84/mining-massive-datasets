# Question 1:

For the following graph:

![Image 1](images/q1-1.gif)

There are eight nodes, named 1 through 8.  Each node has an edge to the next-higher-numbered node, and there is also an edge between 1 and 8.  In addition, there are edges between 2 and 8, between 3 and 7, and between 4 and 6.

Write the adjacency matrix A, the degree matrix D, and the Laplacian matrix L. For each, find the sum of all entries and the number of nonzero entries. Then identify the true statement from the list below.


**Resp:** L has 30 nonzero entries.

# Question 2:

Consider the following undirected graph (i.e., edges may be considered bidirectional):

![Image 2](images/q1-2.jpg)

There are 5 nodes named A through E.  There is an edge between every pair of nodes except for the pair (C,D).

Run the "trawling" algorithm for finding dense communities on this graph and find all complete bipartite subgraphs of types K3,2 and K2,2. Note: In the case of K2,2, we consider {{W, X}, {Y, Z}} and {{Y, Z}, {W, X}} to be identical.

**Resp:** {{A, C, D}, {B, E}} is an instance of K<3,2>

# Question 3:

We fit AGM to the network on the left, and found the parameters on the right:

![Image 3](images/q1-3.jpg)

The network on the left has ten nodes, which we shall refer to as 1 through 10.  There are edges between the following sixteen pairs: 1-2, 1-3, 1-4, 2-3, 3-4, 2-5, 4-5, 5-7, 5-6, 5-10, 6-7, 7-8, 6-8, 6-9, 8-9, and 9-10.  On the right side of the diagram are two trees with roots labeled A and B, and with associated probabilities pA and pB.  A has children 1, 2, 3, 4, and 5, while B has children 5, 6, 7, 8, 9, and 10.  Note that 5 is a child of both.

Find the optimal values for pA and pB. Then identify the correct value below.


**Resp:** pB = 0.6
