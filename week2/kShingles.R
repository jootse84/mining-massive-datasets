# returns the set of k-shingles for the "document" with content text.

kShingles <- function(k, text) {
  numShingles = nchar(text) - k + 1
  # array the chars
  shingles <- rep("", numShingles)

  for (i in 1:numShingles) {
    shingles[i] <- substr(text, i, i+k-1)
  }

  unique(shingles)  
}
