# The ratio of boys to girls born in Russia is 1.09:1. What proportion of Russian families with exactly 6 children 
# will have at least 3 boys? (Ignore the probability of multiple births). 

# Probability of success (having a boy) : p = 1.09/(1.09+1)
# Difference between pbinom and dbinom=> R's dbinom function yields the binomial probability of observing a frequency(f) in a sample of 
# 'n' values. The pbinom function returns the probability of observing 'f' values or less. 

# Read input from STDIN. Print output to STDOUT. 
nums <- suppressWarnings(readLines(file("stdin")))
nums <- as.list(as.data.frame(t(nums)))

p1<-dbinom(3, size=6, prob=109/209)+dbinom(4, size=6, prob=109/209)+dbinom(5, size=6, prob=109/209)+dbinom(6, size=6, prob=109/209)
p2<-signif(p1,digits=3)
write.table(p2, sep = " ", append=T, row.names = F, col.names = F,quote = FALSE,)


# Or using pbinom to exhibit the probability of observing the complement of 2 or less boys:
p3<- 1 - pbinom(2, size = 6, prob = (109/109+100))

# Solution 3
# Parameters
p <- 1.09 / (1.09 + 1)  # Probability of having a boy
q <- 1 - p             # Probability of having a girl
n <- 6                # Number of children in a family

# Initialize the probability of having at least 3 boys
prob_at_least_3_boys <- 0

# Calculate the probability of having 3, 4, 5, or 6 boys 
for (k in 3:6) {
  prob_k_boys <- dbinom(k, n, p)
  prob_at_least_3_boys <- prob_at_least_3_boys + prob_k_boys
  }

# Print the result
cat("Proportion of families with at least 3 boys:", prob_at_least_3_boys, "\n")

