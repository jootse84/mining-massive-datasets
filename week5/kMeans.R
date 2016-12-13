# if kmeans provided, we have already our initial centroids
# returns a list L, L[[1]] is the clusters result, while L[[2]] is the number of reclassifications
# there were needed to calculate the final clusters

kMeans <- function (v, k, kmeans=NULL) {
  if (is.null(kmeans)) {
    kmeans <- v[sample(1:length(v), k, replace=FALSE)] # random initial clusters center
  }
  oldkmeans <- rep(Inf, k)
  clusters <- rep(list(c()), k)
  result <- rep(list(c()), k)

  for (index in seq(1, k)) {
    cluster <- kmeans[index]
  }
  times <- -1 # number of times it is needed to reclasify the points

  while (!all(oldkmeans == kmeans)) {
    oldkmeans <- kmeans
    for (val in v) {
      distances <- sqrt((kmeans - val)^2)
      index <- which(distances == min(distances))

      if (is.null(clusters[[index]])) {
        clusters[[index]] <- c(val)
      } else {
        clusters[[index]] <- c(clusters[[index]], val)
      }
    }
    for (index in seq(1, k)) {
      kmeans[index] <- sum(clusters[[index]]) / length(clusters[[index]])
    }
    times <- times + 1
    result <- clusters
    clusters <- rep(list(c()), k)
    print(kmeans)
  }
  print("finished")
  list(result, times)
}
