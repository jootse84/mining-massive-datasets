
allCombinations <- dget("../week2/allCombinations.R")

completeLinkDis <- function (cluster1, cluster2, values) {
  euc.dist <- function(x1, x2) sqrt(sum((x1 - x2) ^ 2))
  distance <- 0
  for (c1 in cluster1) {
    x1 <- values[c1]
    for (c2 in cluster2) {
      d <- euc.dist(x1, values[c2])
      if (d > distance) {
        distance <- d
      }
    }
  }
  distance
}

hierarchicalClusCompLink <- function(values, names, k) {

  org <- values #save original
  result <- c(character(0))

  while(length(names) > k) {

    combinations <- combn(names, 2)
    dist <- Inf
    remove <- c(0)

    for (index in seq(1, ncol(combinations))) {
      c <- combinations[, index]
      cluster1 <- strsplit(c[1], "")[[1]]
      cluster2 <- strsplit(c[2], "")[[1]]
      d <- completeLinkDis(cluster1, cluster2, values)
      if (d < dist) {
        remove <- c(c[1], c[2])
        dist <- d
      }
    }
    names <- names[!names %in% remove]
    new <- paste(remove, collapse="")
    names <- c(names, paste(sort(strsplit(new, "")[[1]]), collapse=""))
    result <- c(result, names)
  }
  result
}
