# returns the estimation of the second moment (surprise number) with AMS method
# the sum of the squares of the elements (how uneven the distribution is)
# n <- stream length (length(stream))
# a <- value *a* at time 'time'
# X = n x (2 x (number of *a*'s in the stream starting from the chosen) - 1)

estimateSurprise <- function (time, stream) {
  value <- stream[time] 
  subvalues <- stream[time:length(stream)]
  X <- length(stream) * (2 * sum(subvalues == value) - 1)
  X
}
