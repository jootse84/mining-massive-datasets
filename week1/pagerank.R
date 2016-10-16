pagerank <- function(bet, M, n_iter=50, sumPageRanks=1) {
  N = dim(M)[1]
  A = bet * M + (1 - bet) * 1/N * matrix(rep.int(1, N*N), ncol=N)
  r_i = sumPageRanks/N * rep.int(1, N)
  for (i in 1:n_iter) {
    r_i =  A %*% r_i
  }
  r_i
}
