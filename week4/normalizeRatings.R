# Normalize ratings by subtracting user's mean rating
# rowcol == 1 -> normalize by row
# rowcol == 2 -> normalize by col

normalizeRatings <- function (df, rowcol) {
  normalize <- function (x) {
    x - mean(x)
  }
  norm <- apply(df, rowcol, normalize)
  if (rowcol == 1) {
    result <- data.frame(t(norm))
  } else {
    result <- data.frame(norm)
  }
  # result$avg <- apply(df, rowcol, mean, na.rm=TRUE)
  result
}
