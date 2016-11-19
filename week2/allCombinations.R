# returns all combinations of chars in the string 'itemsets'
# if size provided, returns only the combinations with that size

allCombinations <- function (itemsets, size=NULL) {
  for (v in itemsets) {
    charArr <- strsplit(v, NULL)[[1]]
    len <- length(charArr)    
    if (len > 1) {
      for (combcounter in c(1:len - 1)) {
        m_combs <- combn(charArr, combcounter)
        v_combs <- apply(m_combs, 2, paste, collapse="")
        itemsets <- c(itemsets, v_combs)
      }
    }
    itemsets <- unique(itemsets)
  }
  if (!is.null(size)) {
    lenSize <- function (x) {
      nchar(x) == size
    }
    lenSize <- Vectorize(lenSize)
    itemsets <- itemsets[lenSize(itemsets)]
  }
  itemsets
}
