# returns the Laplacian matrix M, given the matrix A representing a graph where:
# rows and cols represents the nodes of the graph
# two nodes n1, n2 are connected -> 1 in A(n1, n2)
# two nodes n1, n2 are not connected -> 0 in A(n1, n2)

laplacian <- function (A) {
  D <- matrix(0, 8, 8)
  for (i in 1:8) {
    D[i, i] <- sum(A[i,])
  }
  L <- D - A
  L
}
