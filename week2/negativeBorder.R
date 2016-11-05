allCombinations <- dget("allCombinations.R")

# return T if item is negative border of itemsets
negativeBorder <- function (itemsets, item) {
  combinations <- combn(strsplit(item, NULL)[[1]], nchar(item) - 1)
  combinations <- unique(apply(combinations, 2, paste, collapse=""))
  itemsets <- allCombinations(itemsets)
  # print(itemsets)
  # print(combinations)
  if (length(combinations) == 0) {
    !(item %in% itemsets)
  } else {
    all(combinations %in% itemsets)
  }
}
