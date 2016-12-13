# cluster is a set of points (dataframe)
# is in cluster? if D == dimensionsof the cluster
# we usually accept mahalanobisDistance =< 3*sqrt(D)

mahalanobisDistance <- function (cluster, point) {
  sds <- sapply(cluster, sd) # standard deviations
  centroid <- sapply(cluster, mean)
  normalizeDistance <- (point - centroid) / sds
  sqrt(sum(normalizeDistance ^ 2))
}
