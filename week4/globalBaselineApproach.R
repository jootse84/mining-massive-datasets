# avg <- mean rating in the whole system (for all items and users)
# avgit <- rating of the item I in the system (for all users)
# avgusr <- mean of all the ratings of user U.
# returns the baseline estimation rating for the item I and user U

globalBaselineApproach <- function (avg, avgit, avgusr) {
  avg + (avgit - avg) + (avgusr - avg)
}
