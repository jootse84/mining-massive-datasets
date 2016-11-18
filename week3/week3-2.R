# Question 1

# 0th moment -> sum elements of stream elevated by 0 (ergo, count elements different to 0)
# 1st moment -> count of number of elements (lenght of the stream)
# 2nd moment (surprise number) -> the sum of the squares of the elements (how uneven the distribution is)

# suppose we have a stream of length 100, in which eleven different elements appear.
# The most even distribution of these eleven elements would have one appearing 10 times
# and the other ten appearing 9 times each. In this case, the surprise number is
# 10^2 + 10 × 9^2 = 910. At the other extreme, one of the eleven elements could
# appear 90 times and the other ten appear 1 time each. Then, the surprise
# number would be 90^2 + 10 × 1^2 = 8110

# we can store *a*, and the count of ocurrences from the randomnly chosen point

estimateSurprise <- dget("estimateSurprise.R")

timestamps <- rep(seq(1,10),7)
timestamps <- c(timestamps, c(1, 2, 3, 4, 5))
test <- list(c(5, 33, 67), c(31, 32, 44), c(14, 35, 42), c(17, 43, 51))

estimates <- c(numeric(0))
for (l in test) {
  values <- c(numeric(0))
  for (t in l) {
    values <- c(values, estimateSurprise(t, timestamps))
  }
  estimates <- c(estimates, sum(values) / 3)
}

surprise <- (5 * 8^2 + 5 * 7^2) # 5 elems x (8 times)^2 + 5 elems x (7 times)^2

# print(estimates)
# print(surprise)
print('Q1')
print(abs(estimates - surprise)==min(abs(estimates - surprise)))
 
# Question 3

estimationFlajoletMartin <- dget("estimationFlajoletMartin.R")

print('Q3')
print(c(estimationFlajoletMartin(c(1, 3, 6, 8)) == 4,
  estimationFlajoletMartin(c(2, 6, 8, 10)) == 4,
  estimationFlajoletMartin(c(2, 6, 8, 9)) == 4,
  estimationFlajoletMartin(c(1, 4, 7, 9)) == 4
))

# Question 4

tvalue <- function(n) {
  memory <- 10^10 # from assignment
  buckets <- 10^6 # from assignment (0 to 999,999)
  users <- 10^8 # from assignment
  bytesneeded <- n * 100 # each email takes 100 bytes
  compression_ratio <- memory/bytesneeded
  compression_ratio*buckets -1 #gotta do -1 because buckets start from 0
}

f <- function (x) {
  test <- x[1]
  resp <- x[2]
  tvalue(test) == resp
}

result <- c(logical(0))
test <- c(10^13, 10^12, 10^10, 10^9)
resp <- c(9, 100, 10000, 999)
solutions <- data.frame(test, resp)

print('Q4')
print(apply(solutions, 1, f))

