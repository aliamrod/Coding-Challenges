# As part of Day 1 challenge, your manager has created a word game for you and your teammates to play.

# The word game begins with your manager writing a string, and a number K on the board.

# You and your teammates must find a substring of size K such that there is exactly one character that is repeated once.

# In other words, there should be K - 1 distinct characters in the substring.

# Write an algorithm to help your teammates find the correct answer. If no such substring can be found, return an empty list;

# If multiple such substrings exist, return all of them, without repetitions. The order in which the substrings are returned does not matter.



# Objective-- Find sustring of size 'K' such that there is exactly one character that is repeated once; if no substring found, return *empty list. 


# Input
# There are two arguments:
# inputString: representing the string written by the manager.
# num: an integer representing the number, K, written by the manager on the board. 


# Output 
# Return a list of all substrings of inputString with K characters, that have K - 1 distinct character, i.e. exactly one character is repeated, or an empty list if 
# no such substring exists in inputString. The order in which the substrings are returned does not matter. 

class Solution:
  def substring_of_size_k(self, inputString, num):
    left, right = 0, num
    if num >= len(inputString):
      return []


    result = []
    while right <= len(inputString):
      if (len(set(inputString[left:right])) == num - 1):
        result.append(inputString[left:right])
      left += 1
      right += 1
    return result



