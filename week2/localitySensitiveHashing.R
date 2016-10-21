# returns a matrix of 2 columns, with the candidates to be similar
# given matrix M, bands and rows.

localitySensitiveHashing <- function(M, bands, rows) {
  # combinations of columns
  combs <- expand.grid(1:dim(M)[2], 1:dim(M)[2])
  combs <- combs[combs[,2]>combs[,1] , ]
  combs <- matrix(unlist(combs, use.names=FALSE),ncol=length(combs))

  sigsimilar <- matrix(numeric(0), 0, 2) # empty matrix with 2 cols 

  for (i in seq(1, rows*bands, by=rows)) {
    for (j in 1:dim(combs)[1]) {
      Maux <- M[i:(i+rows-1), combs[j,]]
      if(all(Maux[,1] == Maux[,2])) {
        sigsimilar <- rbind(sigsimilar, combs[j,])
      }
    }
  }
  sigsimilar <- unique(sigsimilar)
  sigsimilar
}
