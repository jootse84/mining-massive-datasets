
mapReduceM <- function () {
  x <- matrix(c(1, 5, 9, 13, 2,6,10,14,3,7,11,15,4,8,12,16), nrow=4, ncol=4)
  y <- matrix(1:4, nrow=4, ncol=1)

  # Multiply matrix by vector.
  reduce <- sweep(x, MARGIN=2, y, '*')

  # List map/reduce pairs.
  row <- 1
  count <- 0
  pairs <- sapply(seq_along(reduce), function(index) {
    if (count == 4) {
      count <<- 0
      row <<- row + 1
    }
    count <<- count + 1
    list(c(row, t(reduce)[index]))
  })
  pairs
}

pairs <- mapReduceM()
print(pairs)
print(c(c(1,13) %in% pairs, c(3,110) %in% pairs, c(1,2) %in% pairs,  c(3,9) %in% pairs))
