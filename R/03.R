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
