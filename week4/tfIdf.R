# Term frequency–inverse document frequency, is a numerical statistic that
# is intended to reflect how important a word 'i' is to a document 'j' in a
# collection or corpus (tf-idf).

# f <- number of times term 'i' appears in doc 'j'
# maxf <- maximum number of times of term 'i' in any doc
# n <- number of docs that mention term 'i'
# N <- total number of docs

tfIdf <- function (f, maxf, n, N) {
  # Term Frequency number of times the feature 'i' appears in the document
  # 'j' divided by the maximum number of time that same feature appears
  # in any document.
  TF <- f / maxf
  IDF <- log(n / N)
  TF * IDF
}
