# Imagine a small Amazon Go store that has exactly one turnstile. It can be used by customers either as an entrance or an exit.
# Sometimes multiple customers want to pass through the turnstile and their directions can be different. The ith customer comes to the turnstile at time[i]
# and wants to either exit the store if direction [i] = 1 or enter the store if direction[i] = 0. Customers form 2 queues, one to exit and one to enter.
# They are ordered by the time when they came to the turnstile and, if the times are equal, by their indices.

# If one customer wants to enter the store and another customer wants to exit at the sasme moment, there are three cases:

# If in the previous second the turnsile was not used (maybe it was used before, but not at the previous second), then the customer who wants to exit goes first. 

# If in the previous second the turnstile was used as an exit, then the customer who wants to leave goes first.

# If in the previous second the turnstile was used as an entrance, then the customer who wants to enter goes first.
# Passing through the turnstile takes 1 second.

# Write an algorithm to find the time for each customer when they will pass through the turnstile. 

# INPUT
# The function/method consists of three arguments:
# 'numcustomers', an integer representing the number of customers (n); 
# 'arrTime', a list of integers where the value at index 'i' is the time in seconds when the i-th customer will come to the turnstile; 
# 'direction', a list of integers where the value at index 'i' is the direction of the i-th customer. 

# OUTPUT
# Return a list of integers where the value at index 'i' is the time when the i-th customer will pass the turnstile. 


from collections import deque

class Solution:
  def pass_times(self, numcustomers, arrTime, direction):
    enter_q = deque()
    exit_q = deque()
    for i in range(len(arr_time)):
      if direction[i] == 0:
        enter_q.append((arr_time[i], i))
      else:
        exit_q.append((arr_time[i], i))




