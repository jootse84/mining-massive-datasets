result <- matrix(rep(F, 16), ncol=4)

# Exercice 1

cosine <- dget("cosine.R")

u <- c(1, 0.25, 0, 0, 0.5, 0) 
v <- c(0.75, 0, 0, 0.2, 0.4, 0) 
w <- c(0, 0.1, 0.75, 0, 0, 1)

result[1,1] <- cosine(u,w) == 0.9891
result[1,2] <- cosine(u,v) == 0.9496
result[1,3] <- cosine(u,v) == 0.0174
result[1,4] <- cosine(u,v) == 0

# Exercice 2

jaccard <- dget("jaccardSimilarity.R")

a <- c(1,1,1,1,0,0,0,0,0,0)
b <- c(0,1,0,0,1,0,0,1,0,1)
c <- c(0,0,0,0,0,1,1,1,1,0)
d <- c(0,1,1,1,1,1,1,1,1,1)
e <- c(1,0,1,1,1,1,1,1,1,1)

M <- matrix(numeric(0), 0, length(a))
M <- rbind(M, a)
M <- rbind(M, b)
M <- rbind(M, c)
M <- rbind(M, d)
M <- rbind(M, e)
M <- t(M)

# combinations of pairs
combs <- expand.grid(1:dim(M)[2], 1:dim(M)[2])
combs <- combs[combs[,2]>combs[,1] , ]
combs <- matrix(unlist(combs, use.names=FALSE),ncol=length(combs))

jlist <- rep(0, dim(combs)[1])

for (i in 1:dim(combs)[1]) {
  jlist[i] <- (1 - jaccard(M, combs[i,1], combs[i,2]))
}

result[2,1] <- any(jlist == 7/8)
result[2,2] <- any(jlist == 7/10)
result[2,3] <- any(jlist == 5/7)
result[2,4] <- any(jlist == 8/9)


# Exercice 3
# manhattan == taxicab == hamming (for binary data)

manhattan <- dget("manhattan.R")

a <- c(1,1,1,1,0,0,0,0,0,0)
b <- c(0,1,0,0,1,0,0,1,0,1)
c <- c(0,0,0,0,0,1,1,1,1,0)
d <- c(0,1,1,1,1,1,1,1,1,1)
e <- c(1,0,1,1,1,1,1,1,1,1)

M <- matrix(numeric(0), 0, length(a))
M <- rbind(M, a)
M <- rbind(M, b)
M <- rbind(M, c)
M <- rbind(M, d)
M <- rbind(M, e)
M <- t(M)

# combinations of pairs
combs <- expand.grid(1:dim(M)[2], 1:dim(M)[2])
combs <- combs[combs[,2]>combs[,1] , ]
combs <- matrix(unlist(combs, use.names=FALSE),ncol=length(combs))

distances <- rep(0, dim(combs)[1])

for (i in 1:dim(combs)[1]) {
  distances[i] <- manhattan(M[,combs[i,1]], M[,combs[i,2]])
}

result[3,1] <- length(distances[distances==5]) == 2
result[3,2] <- length(distances[distances==5]) == 4
result[3,3] <- length(distances[distances==7]) == 3
result[3,4] <- length(distances[distances==6]) == 1

# Exercice 4

editDistance <- dget("editDistance.R")

a <- "he"
b <- "she"
c <- "his"
d <- "hers"
v <- c(a, b, c, d)

# combinations of pairs
combs <- expand.grid(1:length(v), 1:length(v))
combs <- combs[combs[,2]>combs[,1] , ]
combs <- matrix(unlist(combs, use.names=FALSE),ncol=length(combs))

distances <- rep(0, dim(combs)[1])

for (i in 1:dim(combs)[1]) {
  distances[i] <- editDistance(v[combs[i,1]], v[combs[i,2]])
}

distances

result[4,1] <- length(distances[distances==3]) == 1
result[4,2] <- length(distances[distances==3]) == 3
result[4,3] <- length(distances[distances==2]) == 2
result[4,4] <- length(distances[distances==2]) == 4

result
