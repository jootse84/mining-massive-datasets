# Flajolet-Martin Algorithm
# !! Estimates how many distinct elements are in a stream
# with a single pass and space-consumption
# -------------------------------------------------------------------------
# Whenever we apply a hash function h to a stream element a, the bit string
# h(a) will end in some number of 0’s, possibly none.
# Call this number the tail length for a and h.
# Let R be the maximum tail length of any a seen so far in the stream.
# Then we shall use estimate 2^R for the number of distinct elements
# seen in the stream.

estimationFlajoletMartin <- function (vec) {
  # 4-bit values
  # '0000','0001','0010','0011','0100','0101','0110','0111','1000','1001','1010', ...
  # number of ending 0's (4, 0, 1, ...)
  fourbit <- c(4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1)
  hash_pos <- c(numeric(0))
  for (i in vec) {
    h <- (3 * i + 7) %% 11
    hash_pos <- c(hash_pos, fourbit[h + 1])
  }
  2 ^ max(hash_pos)
}
