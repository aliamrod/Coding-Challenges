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
