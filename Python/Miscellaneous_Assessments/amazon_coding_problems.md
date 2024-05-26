# Amazon Online Assessment Questions (2020 October)

- [Amazon Fresh Promotion](#amazon-fresh-promotion)
- [Five Star Sellers](#five-star-sellers)
- [Transaction Logs](#transaction-logs)
- [Utilization Checks](#utilization-checks)
- [Items in Containers](#items-in-containers)
- [Turnstile](#turnstile)
- [Substrings of Size K with K-1 Distinct Chars](#substrings-of-size-k-with-k-1-distinct-chars)
- [Most Common Word](#most-common-word)
- [Shopping Patterns](#shopping-patterns)
- [Amazon Music Pairs](#amazon-music-pairs)
- [Beta Testing](#beta-testing)
  

## Amazon Fresh Promotion

Amazon Fresh is running a promotion in which customers receive prizes for purchasing a secret combination of fruits. The combination will change each day, and the team running the promotion wants to use a code list to make it easy to change the combination. The code list contains groups of fruits.

Both the order of the groups within the code list and the order of the fruits within the groups matter. However, between the groups of fruits, any number, and type of fruit is allowable. The term "anything" is used to allow for any type of fruit to appear in that location within the group.
Consider the following secret code list: `[[apple, apple], [banana, anything, banana]]`

Based on the above secret code list, a customer who made either of the following purchases would win the prize:

`orange, apple, apple, banana, orange, banana`

`apple, apple, orange, orange, banana, apple, banana, banana`

Write an algorithm to output 1 if the customer is a winner else output 0.

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


```python
class Solution:
  def win_prize(self, codeList, shoppingCart):
      for code in codeList:
        print("shoppingCart {}".format(shoppingCart))
        next_shoppingCart = self.match_in_cart(code, shoppingCart)
        if len(next_shoppingCart) == len(shoppingCart)): return 0
      return 1

  def match_in_cart(self, code, shoppingCart):
    for i in range(len(shoppingCart) - len(code) + 1):
      found_match = True
      for j in range(len(code)):
        if code[j] != 'anything' and code[j] != shoppingCart[i + j]:
          found_match = False
          break
        if found_match:
          print("found match: {}".format(code))
          return shoppingCart[i + len(code):]
        print("did not find a match for {}".format(code))
        return shoppingCart

```

```python
class Solution:
  def win_prize(self, codeList, shoppingCart):
    # If the codeList is empty, the customer is automatically a winner
    if not codeList:
      return 1
    # Pointer for the current position in the shoppingCart
    cart_index = 0
    cart_length = len(shoppingCart)

    # Iterate through each group in the codeList
    for code in codeList:
      # Find the starting position of the current code group in the shoppingCart
      found = False
      while cart_index <= cart_length - len(code):
        match = True
        for j in range(len(code)):
          if code[j] != 'anything' and code[j] != shoppingCart[cart_index + j]:
            match = False
            break
          if match:
            found = True
            cart_index += len(code) # Move the cart_index past the match group
            break
          cart_index += 1 # Move to the next starting position
        if not found:
          return 0
      return 1
# Example usage:
solution = Solution()
codeList = [["apple", "apple"], ["banana", "anything", "banana"]]
shoppingCart = ["orange", "apple", "apple", "banana", "orange", "banana"]
print(solution.win_prize(codeList, shoppingCart))  # Output: 1

shoppingCart = ["apple", "apple", "orange", "orange", "banana", "apple", "banana", "banana"]
print(solution.win_prize(codeList, shoppingCart))  # Output: 1

shoppingCart = ["banana", "orange", "banana", "apple", "apple"]
print(solution.win_prize(codeList, shoppingCart))  # Output: 0
```



