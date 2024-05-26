# We can use a map to store the count of the songs for each length %60. Basically a pair of <length % 60, count>. We only care about the remainder of the length after
# mod 60. While we iterate through the songs, we:

# 1. Check if there is such a key in the map, the sum of that key and current song length % 60 is divisible by 60; if yes, increment the result by the value of that key (count of the qualified songs). 


# So, Return the number of pairs of songs for which their total duration in seconds is divisible by 60.
# Formally, we want the number of indices i, j such that i < j with (time[i] + time[j]) % 60 == 0.


# Input: time = [60, 60, 60] 
# Output: 3
# Explanation: All three pairs have a total duration of 120, which is divisible by 60. 

class Solution: 
  def numPairsDivisibleBy60(self, time: List[int]) -> int:
    songs = {}
    result = 0
    for idx, song in enumerate(time):
      if (60 - song % 60) % 60 in songs: 
        res += songs[(60 - song % 60) % 60]
      songs[song % 60] = songs.get(song % 60, 0) +  1
    return result
