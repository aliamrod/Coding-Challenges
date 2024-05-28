![image](https://github.com/aliamrod/Coding-Challenges/assets/62684338/65e66065-936f-4c38-9a72-38fdc0ac9015)

```python
import math
import os
import random
import re
import sys

from collections import deque

def rotateLeft(d, arr):
  deq = deque(arr)

  # Perform 'd' left rotations
  deq.rotate(-d)

  # Convert deque back to list form
  return list(deq)

```
