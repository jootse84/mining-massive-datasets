isEigenvalue <- function (A, lambda) {
  lI <- lambda * diag(ncol(A))
  AlI <- A - lI
  det(AlI) == 0
}
