# Amazon Online Assessment Questions

1. [Find the missing number in the array](#find-missing-number)
2. [Determine if the sum of two integers is equal to the given value](determine-if-equal-sum)

## Find the missing number in the array
You are given an array of positive numbers from 1 to n, such that all numbers from 1 to n are present except one number x. You have to find x. The input array is not sorted. Look at the below array and give it a try before checking the solution.

![Screenshot 2024-05-26 at 5 04 52 PM](https://github.com/aliamrod/Coding-Challenges/assets/62684338/85952bb8-b83c-4964-bd57-8155b1778818)

```python
class Solution:
  def find_missing(self, input):
    # calculate sum of all elements
    # in input list
    sum_of_elements = sum(input)

    # There is exactly 1 number missing
    n = len(input) + 1
def find_missing(input):
  # calculate sum of all elements 
  # in input list
  sum_of_elements = sum(input)

  n = len(input) + 1
  actual_sum = (n * (n + 1) ) / 2
  return actual_sum - sum_of_elements
```
## Determine if the sum of two integers is equal to the given value
Given an array of integers and a value, determine if there are any two integers in the array whose sum is equal to the given value.
Return true if the sum exists and return false if it does not. Consider this array and the target sums.

```python
class Solution:
  def find_sum_of_two(self, arr, target):
    seen_numbers = set()
  for num in arr:
    complement = target - num
    if complement in seen_numbers:
      return True
    seen_numbers.add(num)
```
