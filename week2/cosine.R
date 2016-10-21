# returns the pair cosine similarity

cosine <- function (u, v, d=4) {
  round(sum(u*v) / (sqrt(sum(u^2)) * sqrt(sum(v^2))), digits=d)
}
