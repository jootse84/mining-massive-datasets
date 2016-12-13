
simulateAllocationsCTR <- function (table, click_through_to_auction) {
  # compute expected revenue
  table[,6] <- table[,1] * table[,2]
  table[,7] <- table[,1] * table[,3]
  table[,8] <- table[,1] * table[,4]

  print(table)

  maxer_idx1 <- which.max(table[,6])
  maxer_idx2 <- which.max(table[,7])
  maxer_idx3 <- which.max(table[,8])

  #   print(maxer_idx1)
  #   print(maxer_idx2)
  #   print(maxer_idx3)

  table[maxer_idx1[1],5] <- table[maxer_idx1[1],5] - table[maxer_idx1[1],1]
  table[maxer_idx2[1],5] <- table[maxer_idx2[1],5] - table[maxer_idx2[1],1]
  table[maxer_idx3[1],5] <- table[maxer_idx3[1],5] - table[maxer_idx3[1],1]
  print(table)
}
