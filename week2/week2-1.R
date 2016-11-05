result <- matrix(rep(F, 20), ncol=4)

# Question 1

localitySensitiveHashing <- dget("localitySensitiveHashing.R")

M <- matrix(c(1,2,3,4,5,6,2,3,1,1,2,1,1,4,2,3,5,6,1,2,3,1,1,4,2,3,1,2,1,1,5,2,3,4,5,1,4,2,2,4,1,4), ncol=7)

candidates <- localitySensitiveHashing(M, 3, 2)

val1 <- candidates == c(1,4)
val2 <- candidates == c(5,7)
val3 <- candidates == c(3,7)
val4 <- candidates == c(6,7)

result[1,1] <- any(val1[,1] & val1[,2])
result[1,2] <- any(val2[,1] & val2[,2])
result[1,3] <- any(val3[,1] & val3[,2])
result[1,4] <- any(val4[,1] & val4[,2])


# Question 2 ???????

# prob C1, C2 identical in particular band
# N are 50% similar
# M are 20% similar
# 1000N pick r = 8
# 10N, pick r = 4.

n <- 0.5
m <- 0.2
rows <- c(1,2,3,4,6,8,12,24)
bands <- 24/rows

# Probability C1, C2 identical in one particular
# band with rows if case N
identicalN <- n^rows
fNegN <- (1 - identicalN) ^ bands
fPosN <- bands * identicalN

# Probability C1, C2 identical in one particular
# band with rows if case M
identicalM <- m^rows
fNegM <- (1 - identicalM) ^ bands
fPosM <- bands * identicalM

matrix(c(rows,
1000 * fNegM + 1000 * fPosM + fNegN + fPosN,
100 * fNegM + 100 * fPosM + fNegN + fPosN,
10 * fNegM + 10 * fPosM + fNegN + fPosN,
fNegM + fPosM + fNegN + fPosN), nrow=length(rows))

# Question 3

kShingles <- dget("kShingles.R")
jaccard <- dget("jaccardSimilarity.R")

ABRACADABRA <- kShingles(2, "ABRACADABRA")
BRICABRAC <- kShingles(2, "BRICABRAC")

# total distinct shingles of both sets
indices = unique(c(ABRACADABRA, BRICABRAC))
M = matrix(rep(0, length(indices)*2), ncol=2)

for (i in 1:length(ABRACADABRA)) {
  index <- which(indices == ABRACADABRA[i])
  M[index,1] <- 1
}
for (i in 1:length(BRICABRAC)) {
  index <- which(indices == BRICABRAC[i])
  M[index,2] <- 1
}

result[3,1] <- 8 == length(intersect(ABRACADABRA, BRICABRAC))
result[3,2] <- (1/2) == jaccard(M, 1, 2)
result[3,3] <- 4 == length(intersect(ABRACADABRA, BRICABRAC))
result[3,4] <- 7 == length(ABRACADABRA)

# Question 4

M = matrix(c(0,1,0,0,1,0,1,0,1,0,0,1,1,1,0,1,1,0,0,1,1,0,0,0), ncol=4)

result[4,1] <- (1/6) == jaccard(M, 1, 2)
result[4,2] <- (2/3) == jaccard(M, 1, 4)
result[4,3] <- (1/6) == jaccard(M, 2, 3)
result[4,4] <- (1/5) == jaccard(M, 2, 3)

# Question 5

minhashing <- dget("minhashing.R")

minh = minhashing(M, c(4, 6, 1, 3, 5, 2))

result[5,1] <- minh[1] == 2
result[5,2] <- minh[4] == 3
result[5,3] <- minh[1] == 6
result[5,4] <- minh[3] == 5

result
