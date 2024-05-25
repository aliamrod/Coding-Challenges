# Given the number of five-star and total reviews for each product a company sells, as well as the threshold percentage, what is the minimum number of
# additional five-star reviews the company needs to become five star seller.

# For ex, there are 3 products (n=3) with productRatings =[[4,4],[1,2],[3,6]], percentage rating threshold = 77.
# [1,2] indicates => [1 (five star reviews) ,2 (total reviews)].
# We need to get the seller reach the threshold with minimum number of additional five star reviews.

# Before we add more five star reviews, the percentage for this seller is ((4/4) + (1/2) + (3/6))/3 = 66.66%
# If we add a five star review to 2nd product, ((4/4) + (2/3) + (3/6))/3 = 72.22%
# If we add another five star review to 2nd product, ((4/4) + (3/4) + (3/6))/3 = 75%
# If we add a five star review to 3rd product, ((4/4) + (3/4) + (4/7))/3 = 77.38%
# At this point, 77% (threshold) is met. Therefore, answer is 3 (because that is the minimum five star reviews we need to add, to get the seller reach the threshold).

# Constraints:
# 1<= productRatings.size() <=200
# In product ratings, [fivestar, total], fivestar <=100, total<=100
# 1<=ratingsThreshold< 100
# productRatings contains only non negative integers.

# Use a priority queue to store the product ratings, basically we always want to boost the product ratings
# by always update the one that increase the average rating most.
# For the metric we can use the difference:  r[0]+1/r[1]+1 - r[0]/r[1], always apply the five start rating to the
# produce that would have the highest increase.
#

import heapq
from typing import List

class Solution:
  def min_five_star_reviews(self, product_ratings: List[List[int]], 
                            
