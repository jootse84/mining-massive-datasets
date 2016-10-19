# returns the statistic value used for comparing the
# similarity and diversity of sample sets (Jaccard index).

jaccard <- function(M, col1, col2) {
  sums = rowSums(M[,c(col1,col2)])

  total = length(sums[sums==1]) + length(sums[sums==2])
  similarity = length(sums[sums==2])
  
  similarity/total
}
