# Question 1
#    1 2 3 4 5 6 7 8
#   ----------------
# 1| 0,1,0,0,0,0,0,1
# 2| 1,0,1,0,0,0,0,1
# 3| 0,1,0,1,0,0,1,0
# 4| 0,0,1,0,1,1,0,0
# 5| 0,0,0,1,0,1,0,0
# 6| 0,0,0,1,1,0,1,0
# 7| 0,0,1,0,0,1,0,1
# 8| 1,1,0,0,0,0,1,0

# L(X) <- D(X) - A(X)

A <- matrix(numeric(0), 0, 8)

A <- rbind(A, c(0,1,0,0,0,0,0,1))
A <- rbind(A, c(1,0,1,0,0,0,0,1))
A <- rbind(A, c(0,1,0,1,0,0,1,0))
A <- rbind(A, c(0,0,1,0,1,1,0,0))
A <- rbind(A, c(0,0,0,1,0,1,0,0))
A <- rbind(A, c(0,0,0,1,1,0,1,0))
A <- rbind(A, c(0,0,1,0,0,1,0,1))
A <- rbind(A, c(1,1,0,0,0,0,1,0))

D <- matrix(0, 8, 8)
for (i in 1:8) {
  D[i, i] <- sum(A[i,])
}

L <- D - A

res <- logical()

res <- c(res, sum(D != 0) == 22)
res <- c(res, sum(D != 0) == 30)
res <- c(res, sum(L != 0) == 30)
res <- c(res, sum(D != 0) == 16)

print(res)

# Question 2
# K(2,2) -> 2 nodes associate to same 2 nodes
# K(3,2) -> 3 nodes associate to same 2 nodes

A <- c('B','C','E')
B <- c('A','C','D','E')
C <- c('A','B','E')
D <- c('B','E')
E <- c('A','B'.'C','D')

# {{A, B}, {D, E}} is an instance of K2,2.
th2 <- c('D', 'E') # B not {'A', 'B'} !!
#  {{A, B, E}, {C, D}} is an instance of K3,2.
th2 <- c('C', 'D') # {B, E} not {A, B, E} !!

# {{A, C, D}, {B, E}} is an instance of K3,2.
th2 <- c('B', 'E') # {A, C, D} --> TRUE!!

# There are 6 instances of K2,2.
# {C,E}, {B,C}, {A, C}, {A, D}, {A, B}, {C, D}, {B, E}...
# FALSE

# Question 3

# Communities: A, B
pA <- 5/10
pB <- 6/10


