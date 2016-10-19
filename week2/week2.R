
# Question 4

jaccard <- dget("jaccardSimilarity.R")

result = matrix(c(F,F,F,F,F,F,F,F), ncol=4)
M = matrix(c(0,1,0,0,1,0,1,0,1,0,0,1,1,1,0,1,1,0,1,1,1,0,0,0), ncol=4)

result[1,1] <- (2/3) == jaccard(M, 3, 4)
result[1,2] <- 0 == jaccard(M, 1, 2)
result[1,3] <- (3/5) == jaccard(M, 2, 4)
result[1,4] <- (1/2) == jaccard(M, 3, 4)

# Question 5

minhashing <- dget("minhashing.R")

minh = minhashing(M, c(4, 6, 1, 3, 5, 2))

result[2,1] <- minh[4] == 2
result[2,2] <- minh[1] == 4
result[2,3] <- minh[3] == 1
result[2,4] <- minh[2] == 6

result
