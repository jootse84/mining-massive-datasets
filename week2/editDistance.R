# returns the approximate string matching distance between 2 strings
# ATTENTION, error on lenLongStr, does not do subsequences, only sequences 

lenLongStr <- function(String1, String2) {
  # courtesy of http://snipplr.com/view/52222/longest-common-substring/
 
  s1 <- unlist(strsplit(String1,split=""))
  s2 <- unlist(strsplit(String2,split=""))
 
  num <- matrix(0, nchar(String1), nchar(String2))
  maxlen <- 0

  for (i in 1:nchar(String1)) {
    for (j in 1:nchar(String2)) {
      if (s1[i] == s2[j]) {
        if ((i==1) || (j==1)) {
          num[i,j] <- 1
        } 
        else {
          num[i,j] <- 1+num[i-1,j-1]
        }
        if (num[i,j] > maxlen) {
          maxlen <- num[i,j]
        }
      }
    }
  }
  maxlen
}

editDistance <- function (a, b) {
  print(c(a, b, nchar(a) + nchar(b) - 2 * lenLongStr(a, b)))
  nchar(a) + nchar(b) - 2 * lenLongStr(a, b)
}
