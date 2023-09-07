# An integer  is a divisor of an integer  if the remainder of n/d=0.
# Given an integer, for each digit that makes up the integer determine whether it is a divisor. Count the number of divisors occurring within the integer.

# Example 
# n = 124
# Check whether 1, 2, and 4 are divisors of 124. All 3 numbers divide evenly into 124 so return 3 .

nums <- scan("stdin", sep = " ")
n <- nums[1] # number of test cases
nums2 <- nums[-1] # without the number of test cases




# SOLUTION 2
countDivisors<- function(n){
  # Convert integer to a character string
  n_str<- as.character(n)

  # Initialize a counter for divisors
  divisor_count <- 0

  # Initialize through the digits
  for (digit in n_str){
    # Convert digit back to integer
    digit_int<-as.integer(digit)

    # Check if the digit is a divisor
    if(digit_int != 0 && n %% digit_int == 0){
      divisor_count<- divisor_count + 1
      }
    }

  # Example Usage
  n <- 124
  divisor_count <- countDivisors(n)
  cat("Number of divisors in", n, ":", divisor_count, "\n")


  
