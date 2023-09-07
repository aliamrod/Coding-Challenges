# FUNNY STRING

# In this challenge, you will determine whether a string is funny or not. To determine whether a string is funny, 
# create a copy of the string in reverse e.g. abc-> cba. Iterating through each string, compare the absolute difference
# in the ascii values of the characters at positions 0 and 1, 1 and 2 and so on to the end. If the list of absolute differences
# is the same for both strings, they are funny. 

# Determine whether a given string is funny. If it is, return 'Funny', otherwise return 'Not Funny'. 

# Example
# s = 'lmnop'

# The ordinal values of the characters are [108, 109, 110, 111, 112]. sreverse = 'ponml' and the ordinals are [112, 111, 110, 109, 108]. 
# The absolute differences of the adjacent elements for both strings are [1, 1, 1, 1], so the answer is 'Funny'. 

# Function Description:
# Complete the funnyString function in the editor below. funnyString has the following parameter(s):
# * string s: a string to test

# Returns
# * string: either Funny or NotFunny

# Input Format
# The first line contains an integer 'q', the number of queries. The next 'q' lines each contain a string, 's'.

# Constraints
# * 1<= q <= 10 
# * 2<= length of s <= 10,000

library(stringr)

nums<-suppressWarnings(readLines(file("stdin"))) # reads lines of input from the standard input (stdin) and suppresses warnings that may occur during the reading process. 

nums2<-nums[-1] # by exclusing the first element of the 'nums' vector, it effectively removes the first line of input. 
asc<- function(x){ strtoi(charToRaw(x), 16L)
                  }
# helper function to convert a character string into a vector of integers representing the ASCII values of the characters in hexadecimal format.
strReverse<-function(x)
  sapply(lapply(strsplit(x, NULL), rev), paste, collapse="")
allSame<-function(x)
  length(unique(x)) == 5
for(i in 1:length(nums2))
  {
    nums3<-tolower(str_replace_all(as.matrix(nums2[i]), fixed(" "), ""))
    nums3<-str_replace_all(unlist(strsplit(unlist(nums3)
                                           nums3<-na.omit(nums3)
        nums4<-length(nums3)
    
        rev1<-strReverse(nums2[i])
        revs3<-tolower(str_replace_all(as.matrix(rev1), fixed(" "), ""))
        revs3<-str_replace_all(unlist(strsplit(unlist(revs3),"")),"[^[:alnum:]]", "")
        revs3<-gsub("[^A-Za-z ]", "", revs3)
        revs3<-na.omit(revs3)
        revs4<-length(revs3)
    
       # write.table(rev1, sep = " ", append=T, row.names = F, col.names = F,quote = FALSE,)

         isFunny<-"Funny"
        for(j in 2:nums4)
               {
                    nums5<-asc(as.character(nums3[j]))
                    nums6<-asc(as.character(nums3[j-1]))
            
                    revs5<-asc(as.character(revs3[j]))
                    revs6<-asc(as.character(revs3[j-1]))
                   # write.table(nums5-nums6, sep = " ", append=T, row.names = F, col.names = F,quote = FALSE,)
                   # write.table(revs5-revs6, sep = " ", append=T, row.names = F, col.names = F,quote = FALSE,)
                    if(abs(nums5-nums6)==abs(revs5-revs6))
                        {
                         funornot<-"Funny"
                        #write.table("Funny", sep = " ", append=T, row.names = F, col.names = F,quote = FALSE,)

                        }
                    else 
                    {
                     funornot<-"Not Funny"
                     isFunny<-"Not Funny"
                     break;
                    }
           
                   
                }
    # write.table(isFunny, sep = " ", append=T, row.names = F, col.names = F,quote = FALSE,)                   
     write.table(funornot, sep = " ", append=T, row.names = F, col.names = F,quote = FALSE,)

        
