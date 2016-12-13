result <- c(logical(0))

# Question 1

cosine <- dget("../week2/cosine.R")

u <- c(1, 0.25, 0, 0, 0.5, 0)
v <- c(0.75, 0, 0, 0.2, 0.4, 0)
w <- c(0, 0.1, 0.75, 0, 0, 1)

r1 <- c(1, -1, 1, -1, 1, -1)
r2 <- c(-1, -1, 1, 1, -1, 1)
r3 <- c(1, 1, 1, 1, 1, 1)

randomHiperplane <- function(aux, r1, r2, r3) {
  aux.r <- c(aux %*% r1, aux %*% r2, aux %*% r3)
  result <- c(numeric(0))

  for (val in aux.r) {
    if (val >= 0) {
      result <- c(result, 1)
    } else {
      result <- c(result, -1)
    }
  }
  print(result)
  result
}

ur <- randomHiperplane(u, r1, r2, r3)
vr <- randomHiperplane(v, r1, r2, r3)
wr <- randomHiperplane(w, r1, r2, r3)

print(cosine(vr, wr))
print(cosine(ur, wr))
print(cosine(ur, vr))

result <- c(result, cosine(vr, wr) == -0.5)
result <- c(result, cosine(vr, wr) == 0)
result <- c(result, cosine(ur, wr) == 1)
result <- c(result, cosine(ur, vr) == 0.5)

print("Q1")
print(result)

# Question 2

# AND we cube the probability associated with h
# OR we 1 - (1 - p)^2

h1 <- 0.6
h2 <- 0.4

result <- c(logical(0))

w <- h1^3
x <- h2^3
y <- 1 - (1 - h1)^2
z <- 1 - (1 - h2)^2

result <- c(result, x == 0.16)
result <- c(result, z == 0.64)
result <- c(result, w == 0.064)
result <- c(result, y == 0.36)

print("Q2")
print(result)


# Question 3

indexingScheme <- function (str, limit) {
  # symbol = floor(limit * length(str) + 1)
  stop <- floor(limit * nchar(str) + 1)
  substr(str, 1, stop)
}

limit <- 0.2

s1 <- 'abcef'
s2 <- 'acdeg'
s3 <- 'bcdefg'
s4 <- 'adfg'
s5 <- 'bcdfgh'
s6 <- 'bceg'
s7 <- 'cdfg'
s8 <- 'abcd'

indexes <- c(indexingScheme(s1, limit), indexingScheme(s2, limit),
  indexingScheme(s3, limit), indexingScheme(s4, limit),
  indexingScheme(s5, limit), indexingScheme(s6, limit),
  indexingScheme(s7, limit), indexingScheme(s8, limit))

compareNum <- function(str, indexes) {
  charArr <- strsplit(str, NULL)[[1]]
  total <- 0
  for (indx in indexes) {
    #print(charArr)
    #print(indx)
    #print(any(charArr %in% strsplit(indx, NULL)[[1]]))
    #print('----')
    if (any(charArr %in% strsplit(indx, NULL)[[1]])) {
      total <- total +1
    }
  }
  total - 1
}

result <- c(logical(0))

result <- c(result, compareNum(indexes[3], indexes) == 4)
result <- c(result, compareNum(indexes[1], indexes) == 5)
result <- c(result, compareNum(indexes[6], indexes) == 2)
result <- c(result, compareNum(indexes[6], indexes) == 3)

print("Q3")
print(result)


# Question 4

compareNum2 <- function(str, indexes) {
  total <- 0
  for (indx in indexes) {
    pointer <- 1
    while ((pointer + nchar(str) - 1) <= nchar(indx)) {
      end <- pointer + nchar(str) - 1
      if (str == substr(indx, pointer, end)) {
        total <- total + 1
        #print(total)
        #print(str)
        #print(substr(indx, pointer, nchar(str)))
        #print('----')
        break
      }
      pointer <- pointer + 1
    }
  }
  total - 1
}

result <- c(logical(0))

result <- c(result, compareNum2(indexes[7], indexes) == 4)
result <- c(result, compareNum2(indexes[2], indexes) == 3)
result <- c(result, compareNum2(indexes[7], indexes) == 3)
result <- c(result, compareNum2(indexes[7], indexes) == 2)

print("Q4")

print(result)
