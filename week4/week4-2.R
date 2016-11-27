# Question 2

isEigenvalue <- dget("isEigenvalue.R")
isEigenvector <- dget("isEigenvector.R")

entries <- c(2, 3, 3, 10)
M <- matrix(entries, nrow=2, byrow=TRUE)
# eigenvalues <- eigen(M)
# lambdas <- eigenvalues$values
# V <- eigenvalues$vectors

result <- c(logical(0))
result <- c(result, isEigenvector(M, c(1, 3)))
result <- c(result, isEigenvector(M, c(1, 11)))
result <- c(result, isEigenvector(M, c(1, 2)))
result <- c(result, isEigenvalue(M, 10))

print(result)

# Question 3

unitEigenvector <- dget("unitEigenvector.R")

v <- c(1, 3, 4, 5, 7)
vU <- unitEigenvector(v)

result <- c(logical(0))
result <- c(result, 0.1 %in% vU)
result <- c(result, 0.28 %in% vU)
result <- c(result, 0.36 %in% vU)
result <- c(result, 0.15 %in% vU)

print(result)

# Question 4
# Compute PCA
# see chapter 11.2.1 from book

M <- matrix(c(1, 1, 2, 2, 3, 4), ncol=2, byrow=TRUE)

MTM <- t(M) %*% M

result <- c(logical(0))
result <- c(result, 21 %in% MTM) 
result <- c(result, 19 %in% MTM)
result <- c(result, 23 %in% MTM)
result <- c(result, 22 %in% MTM)

print(result)

# install.packages("polynom")
# library("polynom")

# Find zeros of a real or complex polynomial
# lambda <- 0
# eq <- (14 - lambda) * (21 - lambda) - (17 * 17) 
# eq <- polynomial(c(5,-35,1))
# print(eq)
# result <- solve(eq) 
# print(result)

# validate
# print((0.143445*0.143445) - (35 * 0.143445))
# print((34.856555*34.856555) - (35 * 34.856555))

# compute eigenvectors of MTM directly
# print(eigen(MTM))
# E <- eigen(MTM)$vectors
# print(E)
# ME <- M %*% E
# print("ME:")
# print(ME)



# Question 5

A <- matrix(c(1, 0, 0, 0, 2, 0, 0, 0, 0), ncol=3, byrow=TRUE)

# A+ %*% A == I
# solve() inverse of a matrix
# A+ = solve(t(A) %*% A) %*% A

# install.packages("corpcor")
library("corpcor")
Ainv <- pseudoinverse(A)

result <- c(logical(0))
result <- c(result, length(which(Ainv == -1)) == 1)
result <- c(result, length(which(Ainv == 0)) == 1)
result <- c(result, length(which(Ainv == Inf)) == 1)
result <- c(result, length(which(Ainv == 1)) == 1)

print(result)

# Question 6

probDistribution <- dget("probDistribution.R")

M <- matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12), ncol=3, byrow=T)

result <- c(logical(0))
result <- c(result, probDistribution(M, 4) == 0.562)
result <- c(result, probDistribution(M, 3) == 0.250)
result <- c(result, probDistribution(M, 1) == 0.147)
result <- c(result, probDistribution(M, 1) == 0.002)

print(result)

