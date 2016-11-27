# check if vector is eigenvector of matrix A, by
# testing if the result of the dot multiplication
# of the vector v with the matrix M returns a value
# scalar with vector v.

# http://math.stackexchange.com/questions/794396/verify-a-vector-is-an-eigenvector-of-a-matrix 

isEigenvector <- function (A, v) {
  # print(A[1,] %*% v / v[1])
  # print(A[2,] %*% v / v[2])

  values <- c(numeric(0))

  for (i in seq(1, ncol(M))) {
    values <- c(values, A[i,] %*% v / v[i])
  }
  # all elements of vector are equals
  length(unique(values)) == 1
}
