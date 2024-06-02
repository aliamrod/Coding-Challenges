![image](https://github.com/aliamrod/Coding-Challenges/assets/62684338/d3ee406f-7cbf-464e-882c-a8723d019fdd)

```python
import os
import random
import re
import sys

from collections import deque

def minimumMoves(grid
  
```





def minimumMoves(grid, startX, startY, goalX, goalY):
    n = len(grid)
    
    # Directions: left, right, up, down
    directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    
    # Queue for BFS
    queue = deque([(startX, startY, 0)])  # (x, y, distance)
    
    # Set for visited cells
    visited = set()
    visited.add((startX, startY))
    
    while queue:
        x, y, dist = queue.popleft()
        
        # If we have reached the goal
        if (x, y) == (goalX, goalY):
            return dist
        
        # Explore all four directions
        for dx, dy in directions:
            nx, ny = x, y
            
            # Move in the direction until hitting a wall or edge of grid
            while 0 <= nx + dx < n and 0 <= ny + dy < n and grid[nx + dx][ny + dy] == '.':
                nx += dx
                ny += dy
                
                if (nx, ny) not in visited:
                    visited.add((nx, ny))
                    queue.append((nx, ny, dist + 1))
    
    # If no path found (though problem guarantees that one exists)
    return -1

# Sample input
grid = [
    "...",
    ".X.",
    "..."
]
startX, startY = 0, 0
goalX, goalY = 0, 2

# Output the result
print(Solution.minimumMoves(grid, startX, startY, goalX, goalY))
