probDistribution <- function (M, row) {
  frobeniusNorm <- sum(M^2)
  round(sum(M[row,]^2) / frobeniusNorm, digits=3)
}
