![image](https://github.com/aliamrod/Coding-Challenges/assets/62684338/9ac070c9-6169-4212-a59f-df7f3a726f0d)




SOLUTION 01
```python
import math
import os
import random
import re
import sys

def matchingStrings(stringList, queries):
  count_dict = {}
  for string in stringList:
    if string in count_dict:
      count_dict[string] += 1
    else:
      count_dict[string] = 1

  result = []
  for query in queries:
    result.append(count_dict.get(query, 0))

  return result

```



SOLUTION 02 
```python
def matchingStrings(strings, queries):
  words = dict()
  result = []

  for w in strings:
    if w in words:
      words[w] += 1
    else:
      words[w] = 1

  for q in queries:
    if q in words:
      ans.append(words[q])
    else:
      ans.append(0)

  return result


```
