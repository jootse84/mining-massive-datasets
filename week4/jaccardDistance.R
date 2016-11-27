# returns the jaccard distance value used for comparing the
# similarity and diversity of sample sets (Jaccard index).

jaccard <- dget("../week2/jaccardSimilarity.R")

jaccardDistance <- function (M, col1, col2) {
  1 - jaccard(ratings, col1, col2)
}
