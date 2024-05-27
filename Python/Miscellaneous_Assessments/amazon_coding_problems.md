# Amazon Online Assessment Questions

- [Amazon Fresh Promotion](#amazon-fresh-promotion)
- [Five Star Sellers](#five-star-sellers)
- [Transaction Logs](#transaction-logs)
- [Utilization Checks](#utilization-checks)
- [Items in Containers](#items-in-containers)
- [Turnstile](#turnstile)
- [Substrings of Size K with K-1 Distinct Chars](#substrings-of-size-k-with-k-1-distinct-chars)
- [Most Common Word](#most-common-word)
- [Shopping Patterns](#Shopping-patterns)
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

SOLUTION 01
```python
class Solution:
  def win_prize(self, codeList, shoppingCart):
    for code in codeList:
      print("shoppingCart {}".format(shoppingCart))
      next_shoppingCart = self.match_in_cart(code, shoppingCart) ***
      if len(next_shoppingCart) == len(shoppingCart): return 0
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
        print("did not find match for {}".format(code))
        return shoppingCart
```
SOLUTION 02
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

## Five Star Sellers

Given the number of five-star and total reviews for each product a company sells, as well as the threshold percentage, what is the minimum number of additional five-star reviews the company needs to become five star seller.
For ex, there are 3 products (n=3) with `productRatings =[[4,4],[1,2],[3,6]]`, percentage rating `threshold = 77`.

`[1,2]` indicates => [1 (five star reviews) ,2 (total reviews)].

We need to get the seller reach the threshold with minimum number of additional five star reviews.

Before we add more five star reviews, the percentage for this seller is `((4/4) + (1/2) + (3/6))/3 = 66.66%`

If we add a five star review to 2nd product, `((4/4) + (2/3) + (3/6))/3 = 72.22%`

If we add another five star review to 2nd product, `((4/4) + (3/4) + (3/6))/3 = 75%`

If we add a five star review to 3rd product, `((4/4) + (3/4) + (4/7))/3 = 77.38%`

At this point, 77% (threshold) is met. Therefore, answer is 3 (because that is the minimum five star reviews we need to add, to get the seller reach the threshold).

Constraints:

```
1<= productRatings.size() <=200
In product ratings, [fivestar, total], fivestar <=100, total<=100
1<=ratingsThreshold< 100
productRatings contains only non negative integers.
```

Solution: Use a priority queue to store the product ratings, basically we always want to boost the product ratings
by always update the one that increase the average rating most.

For the metric we can use the difference: `r[0]+1/r[1]+1 - r[0]/r[1]`, always apply the five start rating to the
produce that would have the highest increase.

```python
import heapq
from typing import List

class Solution:
    def min_five_state_reviews(self, product_ratings: List[List[int]],
                               ratings_threshold: int) -> int:
        n = len(product_ratings)
        pq = [(-self.diff(rating), rating) for rating in product_ratings]
        heapq.heapify(pq)
        ave_rating = sum([r[0] / r[1] for r in product_ratings]) / n
        count = 0

        while ave_rating < ratings_threshold / 100:
            diff, rating = heapq.heappop(pq)
            new_rating = [rating[0] + 1, rating[1] + 1]
            heapq.heappush(pq, (-self.diff(new_rating), new_rating))
            ave_rating = ave_rating - diff / n
            count += 1
        return count

    def diff(self, rating):
        return (rating[0] + 1) / (rating[1] + 1) - (rating[0] / rating[1])
```



## Amazon Music Pairs

You are given a list of songs where the ith song has a duration of time[i] seconds.

Return the number of pairs of songs for which their total duration in seconds is divisible by 60. Formally, we want the number of indices i, j such that i < j with (time[i] + time[j]) % 60 == 0.

 
We can use a map to store the count of the songs for each length % 60. Basically a pair of <length % 60, count>. We only care about the remainder of the length after mod 60. While we iterate through the songs, we:

Check if there is such key in the map, the sum of that key and current song length % 60 is divisible by 60, if yes, increment the result by the value of that key (count of the qualified songs).

```python
class Solution:
  def numPairsDivisibleBy60(self, time: List[int]) -> int:
    songs = {}
    result = 0
    for idx, song in enumerate(time):
      if (60 - song % 60) % 60 in songs:
        result +=  songs[60 - song % 60) % 60]
      songs[song % 60] = song.get(song % 60, 0) + 1
    return result
```

## Most Common Word
Given a string paragraph and a string array of the banned words banned, return the most frequent word that is not banned. It is guaranteed there is at least one word that is not banned, and that the answer is unique.

The words in paragraph are case-insensitive and the answer should be returned in lowercase.

 

Example 1:

Input: paragraph = "Bob hit a ball, the hit BALL flew far after it was hit.", banned = ["hit"]
Output: "ball"
Explanation: 
"hit" occurs 3 times, but it is a banned word.
"ball" occurs twice (and no other word does), so it is the most frequent non-banned word in the paragraph. 
Note that words in the paragraph are not case sensitive,
that punctuation is ignored (even if adjacent to words, such as "ball,"), 
and that "hit" isn't the answer even though it occurs more because it is banned.
Example 2:

Input: paragraph = "a.", banned = []
Output: "a"

SOLUTION 01
```python
class Solution:
  def mostCommonWord(self, paragraph: str, banned: List[str]) -> str:
    def tokenize(paragraph) # tokenization - the `split` method breaks the normalized string into indiviudal words based on spaces.
      words = []
      word = ""
      for i in range(len(paragraph)):
        if paragraph[i] in "!?,.:;":
          if word:
            words.append(word)
          else:
            word += paragraph[i]
          if word:
            words.append(word)
          return words

    words = tokenize(paragraph.lower())
    word_map = {}
    common_word = ("", 0)
    for word in words:
      if word in banned: continue
      word_map[word] = word_map.get(word, 0) + 1
      if (word_map[word] > common_word[1]):
        common_word = (word, word_map[word])
    return common_word[0]
```

SOLUTION 02
```python
import re
from collections import defaultdict
from typing import List

class Solution:
    def mostCommonWord(self, paragraph: str, banned: List[str]) -> str:
        # Normalize the paragraph by converting to lowercase and replacing non-alphanumeric characters with spaces
        normalized_str = re.sub(r'[^\w\s]', ' ', paragraph).lower()
        
        # Tokenize the string into words
        words = normalized_str.split()
        
        # Create a set for banned words for O(1) lookups
        banned_set = set(banned)
        
        # Dictionary to count word frequencies
        word_count = defaultdict(int)
        
        # Count frequencies of words that are not banned
        for word in words:
            if word not in banned_set:
                word_count[word] += 1
        
        # Find the most frequent non-banned word
        most_frequent_word = max(word_count, key=word_count.get)
        
        return most_frequent_word

# Example usage
solution = Solution()
paragraph1 = "Bob hit a ball, the hit BALL flew far after it was hit."
banned1 = ["hit"]
print(solution.mostCommonWord(paragraph1, banned1))  # Output: "ball"

paragraph2 = "a."
banned2 = []
print(solution.mostCommonWord(paragraph2, banned2))  # Output: "a"
```
## Substrings of Size K with K-1 Distinct Chars

Your manager has created a word game for you and your teammates to play. The word game begins with your manager writing a string, and a number K on the board. You and your teammates must find a substring of size K such that there
is exactly one character that is repeated once. In other words, there should be K - 1 distinct characters in the substring. Write an algorithm to help your teammates find the correct answer. If no such substring can be found,
return an empty list; If multiple such substrings exist, return all of them, without repetitions. The order in which the substrings are returned does not matter.

**Input**

It has two arguments:

`inputString`: representing the string written by the manager.

`num`: an integer representing the number K, written by the manager on the board.

**Output**

Return a list of all substrings of inputString with K characters, that have K - 1 distinct character, i.e. exactly one character is repeated,
or an empty list if no such substring exists in inputString. The order in which the substrings are returned does not matter.

**Constraints**

The input integer can only be greater than or equal to 0 and less than or equal to 26 (0 <= num <= 26).
The input string consists of only lowercase alphabetic characters.

**_Solution01_**

```python
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

# Example Usage
result = Solution()
print(result.substring_of_size_k("aababcabc", 3))
```



## Shopping patterns 
Amazon is trying to understand customer shopping patterns and offer items that are regularly bought together to new customers. Each item that has been bought together can be represented as an undirected graph where edges join often bundled products. A group of n products is uniquely numbered from 1 of product_nodes. A trio is defined as a group of three related products that all connected by an edge. Trios are scored by counting the number of related products outside of the trio, this is referred as a product sum.

Given product relation data, determine the minimum product sum for all trios of related products in the group. If no such trio exists, return -1.


<img width="421" alt="image" src="https://github.com/aliamrod/Coding-Challenges/assets/62684338/79c3929d-8a7f-4f19-8368-b3c18aff4108">

**TABLE**
A graph of n = 6 products where the only trio of related products is (2, 4, 5).

The product scores based on the graph above are:
**TABLE**


```python
from collections import defaultdict


class Graph:
    def __init__(self, num_nodes, num_edges):
        self.nodes = list(range(1, num_nodes))
        self.num_edges = num_edges
        self.edges = defaultdict(set)
        self.degrees = defaultdict(int)

    def add_edge(self, n1, n2):
        self.edges[n1].add(n2)
        self.edges[n2].add(n1)
        self.degrees[n1] += 1
        self.degrees[n2] += 1

    def get_degree(self, n):
        return self.degrees[n]

    def edge_exist(self, n1, n2):
        return n2 in self.edges[n1]


class Solution:
    def get_min_score(self, products_nodes, products_edges, products_from,
                      products_to):
        g = Graph(products_nodes, products_edges)

        for i in range(len(products_from)):
            g.add_edge(products_from[i], products_to[i])

        min_score = float('inf')
        visited_trios = set()
        for start_node, end_nodes in g.edges.items():
            for end_node in end_nodes:
                # For each edge, find a third node check if trio
                for node in g.nodes:
                    if node == end_node or node == start_node or tuple(
                            sorted([start_node, end_node, node
                                    ])) in visited_trios:
                        continue
                    if g.edge_exist(start_node, node) and g.edge_exist(
                            end_node, node):
                        # Got a trio
                        min_score = min(
                            g.get_degree(start_node) + g.get_degree(end_node) +
                            g.get_degree(node) - 6, min_score)
                        visited_trios.add(
                            tuple(sorted([start_node, end_node, node])))
        return min_score if min_score != float('inf') else -1
```
