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
