
![image](https://github.com/aliamrod/Coding-Challenges/assets/62684338/70d5203a-b5b2-41f8-9f8e-0df493667f5c)

SOLUTION 01 
```python
# Input
q = int(input().strip())
s1, s2 = [], []

for _ in range(q):
  ops = input().strip().split()

  if len(ops) == 2:
    s1.append(ops[1])
  else:
    if len(s2) == 0:
      while s1:
        s2.append(s1.pop())
    if ops[0] == '2':
      s2.pop()
    else:
      print(s2[-1])
```


SOLUTION 02 
```python
class QueueUsingTwoStacks:
  def __init__(self):
    self.stack1 = []
    self.stack2 = []

  def enqueue(self, x):
    self.stack1.append(x)

  def dequeue(self):
    if not self.stack2:
      while self.stack1:
        self.stack2.append(self.stack1.pop())
    return self.stack2.pop()

  def print_front(self):
    if not self.stack2:
      while self.stack1:
        self.stack2.append(self.stack1.pop())
    print(self.stack2[-1])

# Reading input
import sys
input = sys.stdin.read
data = input().split()

q = int(data[0])
queue = QueueUsingTwoStacks()
index = 1

for _ in range(q):
    query_type = int(data[index])
    if query_type == 1:
        x = int(data[index + 1])
        queue.enqueue(x)
        index += 2
    elif query_type == 2:
        queue.dequeue()
        index += 1
    elif query_type == 3:
        queue.print_front()
        index += 1

```
