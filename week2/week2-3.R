# Question 1

# For Triangular table we need (N^2/2) - N = choose(N,2) integers, 4 bytes each
# choose(n, k) <- n(n-1)...(n-k+1) / k!
# thus choose(N,2)*4 bytes.
triangular_matrix_space_calculator <- function (N) {
  # First pass: every possible items once (10000000)
  # Second pass: every possible frequent pairs (N square divided by 2)
  # Integers are 4 bytes
  choose(N, 2) * 4
}

# Hash table uses item-item-count triples, so 12 bytes per each hash table "item"
# We do not need to save the pairs where one item is unfrequent so we can discard those M pairs, and only store the M pairs that both items are frequent
# Thus we will need M * 12 bytes of memory
triple_method_space_calculator <- function (M) {
  # First pass: every possible items once (10000000)
  # Second pass: 3 times the number of pairs (M because we count only pairs containing a frequent item)
  # Integers are 4 bytes
  (3 * M) * 4
}

minNumBytes <- function (N, M, S) {
  triangular <- triangular_matrix_space_calculator(N)
  triple <- triple_method_space_calculator(M)
  # We keep only the best method in terms of memory
  best <- min(triangular, triple)
  # We accept 10% margin
  all(c(S * 0.9 <= best, best <= S * 1.1))
}

res <- logical()

#N = 20,000; M = 80,000,000; S = 1,100,000,000
res <- c(res, minNumBytes(20000, 80000000, 1100000000))
#N = 20,000; M = 60,000,000; S = 1,000,000,000
res <- c(res, minNumBytes(20000, 60000000, 1000000000))
#N = 10,000; M = 50,000,000; S = 600,000,000
res <- c(res, minNumBytes(10000, 50000000, 600000000))
#N = 30,000; M = 200,000,000; S = 1,800,000,000
res <- c(res, minNumBytes(30000, 200000000, 1800000000))

print(res)

# Question 2

freqItem <- dget("freqItem.R")

transactions <- c('BP', 'CM', 'BCJ', 'PM', 'BCM', 'MJ', 'PJ', 'BCMJ')
test <- c('MJ', 'CM', 'BM', 'PM')
threshold <- 2

res <- logical()
for (val in test) {
  res <- c(res, !freqItem(threshold, transactions, val))
}

print(res)


# Question 3

# s, the support threshold, is 10,000.
# There are one million items, which are represented by the integers 0,1,...,999999.
# There are 250,000 frequent items, that is, items that occur 10,000 times or more.
# There are one million pairs that occur 10,000 times or more.
# There are P pairs that occur exactly once and consist of 2 frequent items.
# No other pairs occur at all.
# Integers are always represented by 4 bytes.
# When we hash pairs, they distribute among buckets randomly, but as evenly as possible; i.e., you may assume that each bucket gets exactly its fair share of the P pairs that occur once.

# main memory equals to number of stuff hashed into frequent basket plus bitmap size
# 12 comes from the fact that 12 bytes needed per hash, since it is (item,item, count) 3 integers 4 bytes each
# bitmap size is one bit per bucket. since there are s/4 buckets size will be s/4/8 bytes

# b = s/4

# s = [1M*p/b]*12 + b/8
# s = [1M * p * 4 / s]*12 + s/32
# s = [48M * p]/s + s/32
# 31/32*s = 48M * p / s
# 31/32*s^2 = 48M * p
# s^2 = 32/31*48M * p
# s^2 = 49548387 * p
# p = s^2 / 49548387

minNumPCYBytes <- function (P, S) {
  best <- sqrt(49548387 * P)
  print(P - S^2/49548387)
  P < S^2/49548387
}

res <- logical()

#S = 500,000,000; P = 10,000,000,000
res <- c(res, minNumPCYBytes(500000000, 10000000000))
#S = 500,000,000; P = 5,000,000,000
res <- c(res, minNumPCYBytes(500000000, 5000000000))
#S = 1,000,000,000; P = 10,000,000,000
res <- c(res, minNumPCYBytes(1000000000, 10000000000))
#S = 300,000,000; P = 750,000,000
res <- c(res, minNumPCYBytes(300000000, 750000000))

print(res)

# Question 4

negativeBorder <- dget("negativeBorder.R")

# frequent itemsets: {A,B}, {A,C}, {A,D}, {B,C}, {E}, {F}
# negative border for: {A,B,C}  {B,E}  {H}  {A,B,D}

freq <- c('AB','AC','AD','BC','E','F')
test <- c('ABC', 'BE', 'H', 'ABD')

res <- logical()
for (val in test) {
  res <- c(res, !negativeBorder(freq, val))
}

print(res)
