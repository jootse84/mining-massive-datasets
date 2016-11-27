# normalize the vector v

unitEigenvector <- function (v) {
  v / sqrt(sum(v^2))
}
