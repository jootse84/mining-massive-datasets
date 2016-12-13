
# Q3
# Suppose we apply the BALANCE algorithm with bids of 0 or 1 only, to a situation where advertiser A bids on query words x and y, while advertiser B bids on query words x and z. Both have a budget of $2. Identify in the list below a sequence of four queries that will certainly be handled optimally by the algorithm.

# Bid goes to bidder with most money reminaing. Default to A. Go through eacy query until queries are filled and both bidders have $0 left.
# xyzx

#iDumb: 2
#Largest-First: 1.5
#Most-Help: 1.25

df <- data.frame(a0=c(1,1,0,0,0), a1=c(0,0,1,1,0), a2=c(1,0,0,0,1), a3=c(0,1,1,0,0), a4=c(0,0,0,1,1))
rownames(df) <- c("b0","b1","b2","b3","b4")

#a0/b0
#a1/b2
#a2/b4
#a3/b1
#a4/b3

#a0/b1
#a1/b3
#a2/b0
#a3/b2
#a4/b4


# Question 4

table <- rbind(c(0.1,0.015,0.010,0.005,1,0.0,0.0,0.0),
              c(0.09,0.016,0.012,0.006,2,0.0,0.0,0.0),
              c(0.08,0.017,0.014,0.007,3,0.0,0.0,0.0),
              c(0.07,0.018,0.015,0.008,4,0.0,0.0,0.0),
              c(0.06,0.019,0.016,0.010,5,0.0,0.0,0.0))

colnames(table) <- c("Bid","CTR1","CTR2","CTR3","Budget","EV1","EV2","EV3")
rownames(table) <- c("A","D","C","D","E")

click_through_to_auction <- 101

simulateAllocationsCTR <- dget("simulateAllocationsCTR.R")
simulateAllocationsCTR(table, click_through_to_auction)
