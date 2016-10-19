# returns the minhashing of the matrix M, with the order of rows
# given by the hash.

minhashing <- function(M, hash) {
  result = rep(Inf, times=dim(M)[2])
  for(i in hash) {
    for(j in 1:dim(M)[2]) {
      if(hash[i] < result[j] && M[hash[i],j] == 1) {
        result[j] = hash[i]
      }
    }
  }
  result
}
