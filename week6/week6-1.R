# Question 1:

testPos <- list(c(5,4), c(8,3))
testNeg <- list(c(7,2), c(3,3))

t1 <- function () {
  result <- c(logical(0))
  for (i in seq(1, length(testPos))) {
    u <- testPos[[i]][1]
    v <- testPos[[i]][2]
    result <- c(result, v >= (7 - 4*u/7))
  }
  for (i in seq(1, length(testNeg))) {
    u <- testNeg[[i]][1]
    v <- testNeg[[i]][2]
    result <- c(result, v <= (7 - 4*u/7))
  }
  all(result)
}

t2 <- function () {
  result <- c(logical(0))
  for (i in seq(1, length(testPos))) {
    u <- testPos[[i]][1]
    v <- testPos[[i]][2]
    result <- c(result, v >= (4 - 3*u/10))
  }
  for (i in seq(1, length(testNeg))) {
    u <- testNeg[[i]][1]
    v <- testNeg[[i]][2]
    result <- c(result, v <= (4 - 3*u/10))
  }
  all(result)
}

t3 <- function () {
  result <- c(logical(0))
  for (i in seq(1, length(testPos))) {
    u <- testPos[[i]][1]
    v <- testPos[[i]][2]
    result <- c(result, v >= (6 - 3*u/5))
  }
  for (i in seq(1, length(testNeg))) {
    u <- testNeg[[i]][1]
    v <- testNeg[[i]][2]
    result <- c(result, v <= (6 - 3*u/5))
  }
  all(result)
}

t4 <- function () {
  result <- c(logical(0))
  for (i in seq(1, length(testPos))) {
    u <- testPos[[i]][1]
    v <- testPos[[i]][2]
    result <- c(result, v >= (6 - u/2))
  }
  for (i in seq(1, length(testNeg))) {
    u <- testNeg[[i]][1]
    v <- testNeg[[i]][2]
    result <- c(result, v <= (6 - u/2))
  }
  all(result)
}

print("Q1")
print(c(t1(), t2(), t3(), t4()))

# distance point to line d(A, L) <- w * A + b
# if line L is w*x+b


# margin <- 1 / ||w|| , being w the weights
# we need to minizime 1/2*||w||^2


# w1 = 0.4998888224807372, w2 = 1.499666467442211, b = -7.498258218864881
# https://github.com/iv-maksimov/coursera-mmds/blob/master/homework_6B(Basic).ipynb

# H(Y) <- -P(+)*log2(P(+)) -P(-)*log2(P(-)) = -5/8*log2(5/8) - 3/8*log2(3/8) = 0.954434 # sum(-p*log^2(p))

########## Select the ones with high IG(Y | A) to do the split, we select here A2

# H(Y | A1=T) <- -P(+)*log2(P(+)) -P(-)*log2(P(-)) = -1/2*log2(1/2) - 1/2*log2(1/2) = 1
# H(Y | A1=F) <- -P(+)*log2(P(+)) -P(-)*log2(P(-)) = -3/4*log2(3/4) - 1/4*log2(1/4) = 0.8112781

# H(Y | A1) <- P(A1=T) * H(Y | A1=T) + P(A1=F) * H(Y | A1=F) = 1/2 * 1 + 1/2 * 0.8112781 = 0.9056391


# H(Y | A2=T) <- -P(+)*log2(P(+)) -P(-)*log2(P(-)) = -1/4*log2(1/4) - 3/4*log2(3/4) = 0.8112781
# H(Y | A2=F) <- -P(+)*log2(P(+)) -P(-)*log2(P(-)) = -1*log2(1) - 0*log2(0) = 0

# H(Y | A2) <- P(A2=T) * H(Y | A2=T) + P(A2=F) * H(Y | A2=F) = 1/2 * 0.8112781 = 0.405639


# The gain in the Gini Index provided by attributes A1 and A2 are equal.
# H(Y | A1) == H(Y | A2) ?? FALSE


# H(Y | A3=T) <- -P(+)*log2(P(+)) -P(-)*log2(P(-)) = -1/2*log2(1/2) - 1/2*log2(1/2) = 1
# H(Y | A3=F) <- -P(+)*log2(P(+)) -P(-)*log2(P(-)) = -1/3*log2(1/3) - 1/4*log2(1/4) = 0.8112781

# H(Y | A3) <- P(A3=T) * H(Y | A3=T) + P(A3=F) * H(Y | A3=F) = 1/2 * 0.8112781 + 1/2 * 1 = 0.9056391

# The attribute A1 gives a better split than the attribute, A3.
# H(Y | A1) > H(Y | A3) ?? FALSE... they are equals!!


# IG(Y | A1) <- H(Y) - H(Y | A1) <- 0.954434 - 0.9056391 = 0.0487949
# IG(Y | A2) <- H(Y) - H(Y | A2) <- 0.954434 - 0.405639 = 0.548795
# IG(Y | A3) <- H(Y) - H(Y | A3) <- 0.954434 - 0.9056391 = 0.0487949


# The impurity of the training set can be reduced at least to some extent by applying any one of the three attributes A1, A2 and A3.
# TRUE, if we split A2, the result of A2=F is all +, while A2=T has 3 - and 1 -. Its IG(Y | A2) it is pretty high!!!

# No further split is good as none of the attributes can reduce the degree of impurity associated with the given training set.
# FALSE, there is a good attribute (A2), with high IG, that it can be used to be split!



# Question 5

euclideanDistance <- function (p1, p2) {
  sqrt(sum((p1 - p2)^2))
}

isPositive <- function (point) {

  negative <- list(c(1,4), c(3,3), c(3,1))
  positive <- list(c(3,6), c(5,3))
  isPositive <- F
  distance <- Inf

  for (i in seq(1, length(negative))) {
    d <- euclideanDistance(point, negative[[i]])
    if (d < distance) {
      distance <- d
    }
  }

  for (i in seq(1, length(positive))) {
    d <- euclideanDistance(point, positive[[i]])
    if (d < distance) {
      isPositive <- T
    }
  }
  isPositive
}

print("Q5")
print(c(isPositive(c(4.1, 4.1)), isPositive(c(4.1, 1.8)), isPositive(c(3.6, 4.1)), isPositive(c(3.9, 4.1))))


