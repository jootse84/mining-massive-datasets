allCombinations <- dget("allCombinations.R")

# return T if item is a frequent item of itemsets
freqItem <- function (threshold, itemset, item) {
  counter <- 0
  for (v in itemset) {
    if(item %in% allCombinations(v)) {
      counter <- counter + 1
    }
  }
  counter >= threshold
}
