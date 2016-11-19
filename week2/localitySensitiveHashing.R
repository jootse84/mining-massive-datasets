# LSH or near-neighbor search
# “Hash” items several times, in such a way that similar items are more
# likely to be hashed to the same bucket than dissimilar.
# We then consider any pair that hashed to the same bucket for any of
# the hashings to be a candidate pair. 

# If the agrupation of rows by value 'rows', on bands 'bands'
# is the same in a combination of 2 columns in matrix M, both 
# columns - items, are considered similars

# returns a matrix of 2 columns, with the candidates to be similar
# given matrix M, bands and rows.

localitySensitiveHashing <- function(M, bands, rows) {
  # combinations of 2 columns (col1(r1), col2(r1)), (col1(r1), col2(r2)), ...
  combs <- expand.grid(1:dim(M)[2], 1:dim(M)[2])
  # combs <- (1, 1), (1, 2), ... (6, 6) 
  combs <- combs[combs[,2]>combs[,1] , ]
  combs <- matrix(unlist(combs, use.names=FALSE),ncol=length(combs))
  # subset of all combs where second column is higher than first, ergo all
  # possible not repeated combinations 7 by 7
  # included <- (1, 2), (5, 6)
  # not included <- (6, 5), (4, 1)

  sigsimilar <- matrix(numeric(0), 0, 2) # empty matrix with 2 cols 

  for (i in seq(1, rows*bands, by=rows)) {
    for (j in 1:dim(combs)[1]) {
      # go through all the combinations, and compare the
      # subset of rows (size = rows) for the combination of columns
      Maux <- M[i:(i+rows-1), combs[j,]]
      if(all(Maux[,1] == Maux[,2])) {
        # if equals, save the column combination in the matrix
        sigsimilar <- rbind(sigsimilar, combs[j,])
      }
    }
  }
  sigsimilar <- unique(sigsimilar) # remove repeated
  sigsimilar
}
