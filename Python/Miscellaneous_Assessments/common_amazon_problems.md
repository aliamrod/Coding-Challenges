# Amazon Online Assessment Questions

1. [Find the missing number in the array](#find-missing-number)
2. [Determine if the sum of two integers is equal to the given value](determine-if-equal-sum)

## Find the missing number in the array
Given an array of integers and a value, determine if there are any two integers in the array whose sum is equal to the given value.
Return true if the sum exists and return false if it does not. Consider this array and the target sums:



![Screenshot 2024-05-26 at 5 04 52 PM](https://github.com/aliamrod/Coding-Challenges/assets/62684338/85952bb8-b83c-4964-bd57-8155b1778818)





**Input**

The input to the function/method consists of two arguments:

`codeList`, a list of lists of strings representing the order and grouping of specific fruits that must be purchased in order to win the prize for the day.

`shoppingCart`, a list of strings representing the order in which a customer purchases fruit.

**Output**

Return an integer 1 if the customer is a winner else return 0.

**Note**
'anything' in the codeList represents that any fruit can be ordered in place of 'anything' in the group. 'anything' has to be something, it cannot be "nothing."

'anything' must represent one and only one fruit.
If secret code list is empty then it is assumed that the customer is a winner.
