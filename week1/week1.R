pagerank <- dget("pagerank.R")
result = matrix(c(F,F,F,F,F,F,F,F,F,F,F,F), ncol=4)


# Question 2

M = matrix(c(0, 0.5, 0.5, 0, 0, 1, 0, 0, 1), ncol=3)
r1 <- pagerank(0.7, M) * 3
a <- r1[1]
b <- r1[2]
c <- r1[3]
result[1,1] <- (b + c) == 2.7
result[1,2] <- (b + c) == 3.25
result[1,3] <- (a + c) == 2.745
result[1,4] <- (a + c) == 1.985


# Question 3

M = matrix(c(0, 0.5, 0.5, 0, 0, 1, 1, 0, 0), ncol=3)
r2 <- pagerank(0.85, M, 500) * 3
a <- r2[1]
b <- r2[2]
c <- r2[3]
result[2,1] <- a == (0.9*c + 0.05*b)
result[2,2] <- a == (c + 0.15*b)
result[2,3] <- 0.95*c == (0.9*b + 0.475*a)
result[2,4] <- 0.85*b == (0.575*a + 0.15*c)


# Question 4

M = matrix(c(0, 0.5, 0.5, 0, 0, 1, 1, 0, 0), ncol=3)
r2 <- pagerank(1, M, 500) * 3
a <- r2[1]
b <- r2[2]
c <- r2[3]
result[3,1] <- c == 9/7
M = matrix(c(0, 0.5, 0.5, 0, 0, 1, 1, 0, 0), ncol=3)
r2 <- pagerank(1, M, 4) * 3
a <- r2[1]
b <- r2[2]
c <- r2[3]
result[3,2] <- b == 0.5
result[3,3] <- b == 11/6
result[3,4] <- a == 9/8
result
