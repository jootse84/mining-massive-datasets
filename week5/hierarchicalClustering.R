# returns 

allCombinations <- dget("../week2/allCombinations.R")

hierarchicalClustering <- function(values, names, k) {

  result <- c(numeric(0))
  clusters <- NULL

  for (v in values) {
    # add number of elements which the value is created
    if (is.null(clusters)) {
      clusters <- list(c(v, 1))
    } else {
      clusters <- c(clusters, list(c(v, 1)))
    }
  }
  values <- as.character(values) # initial clusters

  while(length(names) > k) {

    combinations <- allCombinations(paste(names, collapse=""), 2)

    remove <- c(Inf, Inf)
    centroid <- Inf
    ndigits <- Inf
    sums <- Inf
    distance <- Inf
    ncluster <- c(0)

    for (c in combinations) {
      charray <- strsplit(c, "")[[1]]
      combs <- list(clusters[[strtoi(charray[1])]], clusters[[strtoi(charray[2])]])

      centroid1 <- combs[[1]][1] / combs[[1]][2]
      centroid2 <- combs[[2]][1] / combs[[2]][2]
      d <- abs(centroid1 - centroid2)
      # print(paste(combs[[1]][1], " + ", combs[[2]][1], ": ", d))

      if (d < distance) {

        sums <- combs[[1]][1] + combs[[2]][1]
        ndigits <- combs[[1]][2] + combs[[2]][2]
        ncluster <- as.character(c(combs[[1]][1], combs[[2]][1])) # new cluster

        distance <- d 

        centroid <- round(sums / ndigits, digits=1)
        remove <- c(strtoi(charray[1]), strtoi(charray[2]))
      }
    }
    result <- c(result, centroid)

    # update list of clusters
    values <- values[!values %in% ncluster]
    values <- c(values, paste(ncluster, collapse=", "))

    names <- names[!(names %in% remove)]
    clusters <- c(clusters[names], list(c(sums, ndigits)))
    names <- seq(1, length(clusters))
  }
  result
}
