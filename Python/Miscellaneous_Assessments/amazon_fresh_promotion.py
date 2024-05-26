# Amazon Fresh is running a promotion in which customers receive prizes for purchasing a secret combination of fruits.
# The combination will change each day, and the team running the promotion wants to use a code list to make it easy to change the combination.
# The code list contains groups of fruits.

# Both the order of the groups within the code list and the order of the fruits within the groups matter. However, between the groups of fruits, any number,
# and type of fruit is allowable. The term "anything" is used to allow for any type of fruit to appear in that location within the group.
# Consider the following secret code list: [[apple, apple], [banana, anything, banana]]

# Based on the above secret code list, a customer who made either of the following purchases would win the prize:

# orange, apple, apple, banana, orange, banana

# apple, apple, orange, orange, banana, apple, banana, banana

# Write an algorithm to output 1 if the customer is a winner else output 0.


# Input 
# The input to the function/method consists of two arguments:
# 'codeList', a list of strings representing the order and grouping of specific fruits that must be purchased in order to win the prize for the day. 
# 'shoppingCart', a list of strings representing the order in which a customer purchases fruit.

# Output 
# Return an integer 1 if the customer is a winner else return 0. 

class Solution: 
  def win_prize(self, codeList, shoppingCart):
    for code in codeList:
      print("shoppingCart:{}".format(shoppingCart))
      next_shoppingCart = self.match_in_cart(code, shoppingCart)
      if (len(next_shoppingCart) == len(shoppingCart)): return 0
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
        print("did not find a match for {}.format(code))
        return shoppingCart
