
jaccardDistance <- dget("jaccardDistance.R")
allCombinations <- dget("../week2/allCombinations.R")

hierarchicalClustering <- function(ratings, names, k) {

  combinations <- allCombinations(paste(names, collapse=""), 2)

  m <- matrix(Inf, ncol=dim(ratings)[2], nrow=dim(ratings)[2])
  colnames(m) <- names
  rownames(m) <- names
  df <- data.frame(m)

  for (c in combinations) {
    charray <- strsplit(c, "")[[1]]
    sim <- jaccardDistance(ratings, charray[1], charray[2])
    df[charray[1], charray[2]] <- round(sim, digits=3)
    df[charray[2], charray[1]] <- round(sim, digits=3)
  }

  org <- df # original copy

  while(length(names) > k) {

    # print(df)
    # print(names)
    x <- floor(which(df == min(df))[1] / length(names))
    y <- floor(which(df == min(df))[1] %% length(names))

    if (y == 0) {
      if (x == 0) {
        x <- 1
      }
      y <- length(names)
    } else {
      x <- x + 1
    }

    remove <- c(names[x], names[y])
    newcluster <- paste(names[x], names[y], sep="")

    df[newcluster] <- Inf
    df[newcluster, ] <- Inf

    names <- names[!names %in% remove]

    for (i in names) {
      combinations <- allCombinations(paste(c(i, newcluster), collapse=""), 2)
      dis <- 0
      for (c in combinations) {
        charray <- strsplit(c, "")[[1]]
        dis <- dis + org[charray[1], charray[2]]
      }
      dis <- dis / length(combinations)
      df[i, newcluster] <- dis
      df[newcluster, i] <- dis
    }

    names <- c(names, newcluster)
    df <- df[!(names(df) %in% remove), !(names(df) %in% remove)]
  }
  names
}
