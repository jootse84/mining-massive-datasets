allCombinations <- function (itemsets) {
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
  itemsets
}
