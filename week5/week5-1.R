# Question 1

kMeans <- dget("kMeans.R")

c <- c(1, 4, 9, 16, 25, 36, 49, 64, 81, 100)
k <- 2
# The mean of these two points (25, 81) is 53, so the initial clustering is {1,4,...,49}{64,81,100}. The centroids of these two clusters are 20 and 81.7. Since the mean of those two centroids is 50.8, all points are reassigned to the same cluster in which they were placed initially.

result <- c(logical(0))
#result <- c(result, kMeans(c, k, c(25, 81))[[2]] == 1) # error
#result <- c(result, kMeans(c, k, c(4, 16))[[2]] == 1)
#result <- c(result, kMeans(c, k, c(1, 25))[[2]] == 1)
#result <- c(result, kMeans(c, k, c(9, 26))[[2]] == 1)

# result <- c(result, kMeans(c, k, c(1, 25))[[2]] == 1) # error
# result <- c(result, kMeans(c, k, c(4, 64))[[2]] == 1)
# result <- c(result, kMeans(c, k, c(4, 25))[[2]] == 1)
# result <- c(result, kMeans(c, k, c(25, 81))[[2]] == 1)

result <- c(result, kMeans(c, k, c(9, 81))[[2]] == 2)
result <- c(result, kMeans(c, k, c(4, 81))[[2]] == 2)
result <- c(result, kMeans(c, k, c(9, 49))[[2]] == 2)
result <- c(result, kMeans(c, k, c(9, 64))[[2]] == 2)

print("Q1")
print(result)

# Question 2

L1Norm <- dget("L1Norm.R")
L2Norm <- dget("L2Norm.R")

centroids <- list(c(0, 0), c(100, 40))

a <- c(51,15)
b <- c(58,13)
c <- c(56,13)
d <- c(63,8)

result <- c(logical(0))
result <- c(result, !identical(L1Norm(centroids, a), L2Norm(centroids, a)))
result <- c(result, !identical(L1Norm(centroids, b), L2Norm(centroids, b)))
result <- c(result, !identical(L1Norm(centroids, c), L2Norm(centroids, c)))
result <- c(result, !identical(L1Norm(centroids, d), L2Norm(centroids, d)))

print("Q2")
print(result)

# Question 3

values <- list(c(1, 1), c(4, 1), c(9, 1), c(16, 1), c(25, 1), c(36, 1), c(49, 1), c(64, 1))
values <- c(1, 4, 9, 16, 25, 36, 49, 64)
names <- seq(1, length(values))

# 49.7  25.5  30.5  38.0

hierarchicalClustering <- dget("hierarchicalClustering.R")
centroids <- hierarchicalClustering(values, names, 2)
#print(centroids)

result <- c(logical(0))
result <- c(result, 38.0 %in% centroids)
result <- c(result, 42.5 %in% centroids)
result <- c(result, 30.5 %in% centroids)
result <- c(result, 25.5 %in% centroids)

print("Q3")
print(result)

# Question 4 -- repeated??

L1Norm <- dget("L1Norm.R")
L2Norm <- dget("L2Norm.R")

centroids <- list(c(0, 0), c(100, 40))

a <- c(59,10)
b <- c(54,8)
c <- c(52,13)
d <- c(61,10)
result <- c(logical(0))
result <- c(result, !identical(L1Norm(centroids, a), L2Norm(centroids, a)))
result <- c(result, !identical(L1Norm(centroids, b), L2Norm(centroids, b)))
result <- c(result, !identical(L1Norm(centroids, c), L2Norm(centroids, c)))
result <- c(result, !identical(L1Norm(centroids, d), L2Norm(centroids, d)))

print("Q4")
print(result)

# Question 5

# pA probability P(A or B) = P(A) + P(B) - P(A and B)
# The probability that A is correct is 24% - correct
# The probability that both A and C are correct is 5% - ??

# incorrects
# The probability that A is correct is 19%
# The probability that both A and C are correct is 12%
# The probability that C is correct is 5%

# Hint: we can assign each of x, y, and z to A, B, or C in 27 possible ways. However, we can organize them into a small number of groups of assignments that "look" the same and have the same probability. For example, one group is the assignment where one of x, y, and z goes into B and the other two go into the same one of A and C. Analyze each of these groups to see if A and/or C is "correct."

# Question 6

df <- data.frame(A=c(0,0), B=c(10,10), C=c(21,21), D=c(33,33), E=c(5,27), F=c(28,6))

hierarchicalClusCompLink <- dget("hierarchicalClusCompLink.R")
clusters <- hierarchicalClusCompLink(df, names(df), 2)

result <- c(logical(0))
result <- c(result, "CD" %in% clusters)
result <- c(result, "ABCDF" %in% clusters)
result <- c(result, "ABCD" %in% clusters)
result <- c(result, "CDF" %in% clusters)

print("Q6")
print(result)
