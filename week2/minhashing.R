# returns the minhashing of the matrix M, with the order of rows
# given by the hash.

minhashing <- function(M, hash) {
  result = rep(Inf, times=dim(M)[2])
  for(h in hash) {
    for(j in 1:dim(M)[2]) {
      if(result[j] == Inf && M[h,j] == 1) {
        result[j] = h
      }
    }
  }
  result
}
