# Question 1

M <- c(A=1, B=2, C=5)
N <- c(A=2, B=3, C=5)
P <- c(A=3, B=2, C=5)
Q <- c(A=4, B=5, C=3)
R <- c(A=5, B=3, C=2)

movies <- data.frame(M, N, P, Q, R)

normalizeRatings <- dget("normalizeRatings.R")

norm_df <- normalizeRatings(movies, 1)
norm_df <- normalizeRatings(norm_df, 2)

result <- c(logical(0))
result <- c(result, norm_df$M[1] == min(norm_df))
result <- c(result, norm_df$Q[1] == -3)
result <- c(result, norm_df$Q[2] == max(norm_df))
result <- c(result, sum(norm_df == 0) > sum(norm_df == 1))

print("Q1")
print(result)

# Question 2
# Item-Item Collaborative filtering (usually works better than User-User)
# Predict user's A rating on item I:
# 1. calculate cosine similarities between item I, and rest of items
# 2. select N items with highest similarity that has rating by the user A (i.e. 2 items - it1 and it2)
# 3. predicted rating by A on I <- [sim(it1) * rat(it1) + sim(it2) * rat(it2)] / (sim(it1) + sim(it2))

O <- c(A=1, B=1, C=0)
P <- c(A=0, B=1, C=1)
Q <- c(A=1, B=0, C=0)
R <- c(A=0, B=0, C=1)
S <- c(A=1, B=1, C=0)
rating <- c(A=2, B=6, C=2)

A <- data.frame(O, P, Q, R, S, rating)
scale <- A

cosineDistance <- function (row1, row2) {
  # cosine distances between each pair of profiles
  sum(row1 * row2) / (sqrt(sum(row1 ^ 2)) * sqrt(sum(row2 ^ 2)))
}

cosDisSim <- function (row1, row2) {
  # cosine distances similarity between each pair of profiles
  (1 - cosineDistance(row1, row2))
}

result <- c(logical(0))

# For α = 2, A is closer to C than B is.
factor <- 2
scale$rating <- A$rating * factor
result <- c(result, !cosDisSim(scale["A",], scale["C",]) < cosDisSim(scale["C",], scale["B",]))

# For α = 1, C is closer to B than A is.
factor <- 1
scale$rating <- A$rating * factor
result <- c(result, !cosDisSim(scale["C",], scale["B",]) < cosDisSim(scale["B",], scale["A",]))

# For α = 1, B is closer to A than C is.
result <- c(result, !cosDisSim(scale["B",], scale["A",]) < cosDisSim(scale["A",], scale["C",]))

# For α = 0.5, A is closer to B than C is.
factor <- 0.5
scale$rating <- A$rating * factor
result <- c(result, !cosDisSim(scale["A",], scale["B",]) < cosDisSim(scale["B",], scale["C",]))

print(result)

# Question 3
a <- c(A=4, B=0, C=2)
b <- c(A=5, B=3, C=0)
c <- c(A=0, B=4, C=1)
d <- c(A=5, B=3, C=3)
e <- c(A=1, B=1, C=0)
f <- c(A=0, B=2, C=4)
g <- c(A=3, B=1, C=5)
h <- c(A=2, B=0, C=3)

ratings <- data.frame(a, b, c, d, e, f, g, h)
ratings[ratings == 1] <- 0
ratings[ratings == 2] <- 0
ratings[ratings == 3] <- 1
ratings[ratings == 4] <- 1
ratings[ratings == 5] <- 1

names <- c("a", "b", "c", "d", "e", "f", "g", "h")
k <- 4

hierarchicalClustering <- dget("hierarchicalClustering.R")
clusters <- hierarchicalClustering(ratings, names, k)

result <- c(logical(0))
result <- c(result, "bdg" %in% clusters)
result <- c(result, "dg" %in% clusters)
result <- c(result, "e" %in% clusters)
result <- c(result, "g" %in% clusters)

print(result)

# Question 4

# first row 5*x
# second row 5*y
# third row 5*z

# optim in R


dat <- data.frame(x=c(1, 2, 3), y=c(4, 5, 6), z=c(7, 8, 9))
min.RSS <- function(data, par) {
  with(data, sqrt(sum((x - 5 * par[1]) ^ 2) + sum((y - 5 * par[2]) ^ 2) + sum((z - 5 * par[3]) ^ 2)))
}
# par, initial value that will vary to try to optimize the sumsquare
values <- optim(par=c(0, 0, 0), min.RSS, data = dat)


values <- values$par

result <- c(logical(0))
# y = 2/3
result <- c(result, format(round(2/3, 2), nsmall = 2) == format(round(values[2], 2), nsmall = 2))
# y = 5
result <- c(result, "5.00" == format(round(values[2], 2), nsmall = 2))
# y = 1
result <- c(result, "1.00" == format(round(values[2], 2), nsmall = 2))
# x = 2
result <- c(result, "2.00" == format(round(values[1], 2), nsmall = 2))

print(result)

