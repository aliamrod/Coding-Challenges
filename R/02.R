# A manufacturer of metal pistons finds that on average, 12% of his pistons are rejected because they are either oversized
# or undersized. What is the probability that a batch of 10 pistons will contain:
# (1) no more than 2 rejects?
# (2) at least 2 rejects?

p1<- pbinom(2, size = 10, prob = 0.12)

# at least 2 rejects => at least 2 rejects or complement of no more than 1 reject. 
p2<- (1) - pbinom(1, size = 10, prob = 0.12)

write.table(signif(p1, digits=3), sep = " ", append=T, row.names = F, col.names = F, quote = FALSE,)
write.table(signif(p2, digits=3), sep = " ", append=T, row.names = F, col.names = F, quote = FALSE, )
            
