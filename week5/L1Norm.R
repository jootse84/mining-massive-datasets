L1Norm <- function (centroids, point) {
  actual <- Inf
  result <- c(Inf, Inf)
  for (centro in centroids) {
    distance <- sum(abs(centro - point))
    if(distance < actual) {
      actual <- distance
      result <- centro
    }
  }
  result
}
