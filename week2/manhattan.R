# returns the manhattan-hamming distance between 2 vectors

manhattan <- function (u, v) {
  z <- (u == v)
  length(z[z==FALSE])
}
