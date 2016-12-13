L2Norm <- function (centroids, point) {
  actual <- Inf
  result <- c(Inf, Inf)
  for (centro in centroids) {
    distance <- sum((centro - point)^2)
    if(distance < actual) {
      actual <- distance
      result <- centro
    }
  }
  result
}
