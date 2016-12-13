# Question 1

cosine <- dget("../week2/cosine.R")

h <- c(1, 1, 1, 1)
L <- matrix(c(0,1,0,0,1,0,0,0,1,0,0,1,0,0,1,0), nrow=4, ncol=4)

a <- t(L) %*% h
a <- a / max(a)
print(a)

La <- L %*% a
h2 <- La / max(La)
print(h2)

a2 <- t(La) %*% h2
a2 <- a2 / max(a2)
print(a2)

La2 <- La %*% a2
La2 <- La2 / max(La2)
print(La2)



#result <- c(result, cosine(vr, wr) == -0.5)

result <- c(logical(0))

print("Q1")
print(result)

