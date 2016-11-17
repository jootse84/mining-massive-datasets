# In natural language processing a w-shingling is a set of unique "shingles" (n-grams, contiguous subsequences of tokens in a document) that can be used to gauge the similarity of two documents. The w denotes the number of tokens in each shingle in the set.

# The document, "a rose is a rose is a rose" can be tokenized as follows:
# (a,rose,is,a,rose,is,a,rose)

# The set of all contiguous sequences of 4 tokens (4-grams) is
# { (a,rose,is,a), (rose,is,a,rose), (is,a,rose,is), (a,rose,is,a), (rose,is,a,rose) } = { (a,rose,is,a), (rose,is,a,rose), (is,a,rose,is) }

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
