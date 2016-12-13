
Question 1: We can cluster in one dimension as well as in many dimensions. In this problem, we are going to cluster numbers on the real line. The particular numbers (data points) are 1, 4, 9, 16, 25, 36, 49, 64, 81, and 100, i.e., the squares of 1 through 10. We shall use a k-means algorithm, with two clusters. You can verify easily that no matter which two points we choose as the initial centroids, some prefix of the sequence of squares will go into the cluster of the smaller and the remaining suffix goes into the other cluster. As a result, there are only nine different clusterings that can be achieved, ranging from {1}{4,9,...,100} through {1,4,...,81}{100}.
We then go through a reclustering phase, where the centroids of the two clusters are recalculated and all points are reassigned to the nearer of the two new centroids. For each of the nine possible clusterings, calculate how many points are reclassified during the reclustering phase. Identify in the list below the pair of initial centroids that results in exactly one point being reclassified.
 25 and 81  4 and 16  1 and 25  9 and 36
- unanswered
Question 2: Suppose we want to assign points to one of two cluster centroids, either (0,0) or (100,40). Depending on whether we use the L1 or L2 norm, a point (x,y) could be clustered with a different one of these two centroids. For this problem, you should work out the conditions under which a point will be clustered with the centoid (0,0) when the L1 norm is used, but clustered with the centroid (100,40) when the L2 norm is used. Identify one of those points from the list below.
 (50,18)  (55,5)  (63,8)  (53,15)
- unanswered
Question 3: Suppose our data set consists of the perfect squares 1, 4, 9, 16, 25, 36, 49, and 64, which are points in one dimension. Perform a hierarchical chustering on these points, as follows. Initially, each point is in a cluster by itself. At each step, merge the two clusters with the closest centroids, and continue until only two clusters remain. Which of the following is the centroid of a cluster that exists at some time during this process? Positions are represented to the nearest 0.1. null
 49.7  25.5  30.5  38.0
- unanswered
Question 4: Suppose we want to assign points to one of two cluster centroids, either (0,0) or (100,40). Depending on whether we use the L1 or L2 norm, a point (x,y) could be clustered with a different one of these two centroids. For this problem, you should work out the conditions under which a point will be clustered with the centoid (0,0) when the L1 norm is used, but clustered with the centroid (100,40) when the L2 norm is used. Identify one of those points from the list below.
 (52,13)  (51,18)  (55,5)  (58,13)
- unanswered
Question 5: Suppose that the true data consists of three clusters, as suggested by the diagram below:
There are three circles labeled A, B, and C, arranged horizontally in that order from left to right.  B is considerably larger than A and C, which are the same size.
There is a large cluster B centered around the origin (0,0), with 8000 points uniformly distributed in a circle of radius 2. There are two small clusters, A and C, each with 1000 points uniformly distributed in a circle of radius 1. The center of A is at (-10,0) and the center of C is at (10,0).
Suppose we choose three initial centroids x, y, and z, and cluster the points according to which of x, y, or z they are closest. The result will be three apparent clusters, which may or may not coincide with the true clusters A, B, and C. Say that one of the true clusters is correct if there is an apparent cluster that consists of all and only the points in that true cluster. Assuming initial centroids x, y, and z are chosen independently and at random, what is the probability that A is correct? What is the probability that C is correct? What is the probability that both are correct?
After computing these probabilities, identify the true statement from the list below. Note: probabilities are rounded to the nearest percent.
 The probability that C is correct is 5%  The probability that A is correct is 24%  The probability that A is correct is 19%  The probability that both A and C are correct is 12%
- unanswered
Question 6: Perform a hierarchical clustering of the following six points:
There are six points named A through F, arranged to have the following coordinates in a grid. A: (0,0). B: (10,10), C: (21,21), D: (33,33), E: (5,27), F: (28,6).
using the complete-link proximity measure (the distance between two clusters is the largest distance between any two points, one from each cluster). Which of the following is a cluster at some stage of the agglomeration?
 {C,D}  {A,B,E}  {A,B,C,D}  {C,E}
