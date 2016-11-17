
# returns the Laplacian graph given the matrix A:
# rows and cols are nodes of the graph, 1's in matrix
# when two nodes are connected.
laplacian <- function (A) {
  D <- matrix(0, 8, 8)
  for (i in 1:8) {
    D[i, i] <- sum(A[i,])
  }
  L <- D - A
  L
}
