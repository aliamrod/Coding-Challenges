# Amazon Online Assessment Questions

1. [Find the missing number in the array](#find-the-missing-number-in-the-array)
2. [Determine if the sum of two integers is equal to the given value](determine-if-equal-sum)
3. [Merge two sorted linked lists](merge-two-sorted-linked-lists)
4. [Level Order Traversal of Binary Tree](level-order-traversal-of-binary-tree)
5. *
6. *
7. *
8. *
9. *
10. 8
11. *
12. *
13. *
14. &
15. *
16. s
17. s
18. s
19. s
20. s
21. s



## Find the missing number in the array
You are given an array of positive numbers from 1 to n, such that all numbers from 1 to n are present except one number x. You have to find x. The input array is not sorted. Look at the below array and give it a try before checking the solution.

![Screenshot 2024-05-26 at 5 04 52 PM](https://github.com/aliamrod/Coding-Challenges/assets/62684338/85952bb8-b83c-4964-bd57-8155b1778818)

```python
class Solution:
  def find_missing(self, input):
    # calculate sum of all elements
    # in input list
    sum_of_elements = sum(input)

    # There is exactly 1 number missing
    n = len(input) + 1
def find_missing(input):
  # calculate sum of all elements 
  # in input list
  sum_of_elements = sum(input)

  n = len(input) + 1
  actual_sum = (n * (n + 1) ) / 2
  return actual_sum - sum_of_elements
```
## Determine if the sum of two integers is equal to the given value
Given an array of integers and a value, determine if there are any two integers in the array whose sum is equal to the given value.
Return true if the sum exists and return false if it does not. Consider this array and the target sums.

```python
class Solution:
  def find_sum_of_two(self, arr, target):
    seen_numbers = set()
  for num in arr:
    complement = target - num
    if complement in seen_numbers:
      return True
    seen_numbers.add(num)
```
## Merge two sorted linked lists
Given two sorted linked lists, merge them so that the resulting linked list is also sorted. Consider two sorted linked lists an the merged list below them as an example.
![Screenshot 2024-05-26 at 5 42 47 PM](https://github.com/aliamrod/Coding-Challenges/assets/62684338/81fb3895-97c2-4f58-b7b4-61083a566602)

```python
class Solution:
  def merge_sorted(self, head1, head2):
  # Initialize a dummy node to help with the merge process

  dummy = ListNode()
  current = dummy


  # Traverse both lists and merge them
  while head1 and head2:
    if head1.val < head2.val:
      current.next = head1
      head1 = head1.next
    else:
      current.next = head2
      head2 = head2.next
    current = current.next
  # Attach the remaining nodes of the non-empty list
  if head1:
    current.next = head1
  elif head2:
    current.next = head2

  # Return the merged list starting from the next node of the dummy
  return dummy.next

  # Helper function to print linked list
  def print_list(node):
    while node:
      print(node.val, end="->")
      node = node.next
    print("None")
# Example usage:
# List 1: 1 -> 2 -> 4
# List 2: 1 -> 3 -> 4

head1 = ListNode(1, ListNode(2, ListNode(4)))
head2 = ListNode(1, ListNode(3, ListNode(4)))

merged_head = merge_sorted(head1, head2)
print_list(merged_head)
```

## Level Order Traversal of Binary Tree
Given the root of a binary tree, display the node values at each level. Node values for all levels should be displayed on separate lines. Let's take a look at the below binary tree. 

![Screenshot 2024-05-26 at 6 21 18 PM](https://github.com/aliamrod/Coding-Challenges/assets/62684338/70ef0f56-b072-4d4e-9854-aeacbf341893)


```python
class Solution:
  def level_order_traversal(self, root):
    if root == None:
      return
    result = ""
    queues = [dequeue(), dequeue()]

    current_queue = queues[0]
    next_queues = queues[1]

    current_queue.append(root)
    level_number = 0

    while current_queue:
      temp = current_queue.popleft()
      result += str(temp.data) + " "

      if temp.left != None
        next_queue.append(temp.left)
      if temp.right != None
        next_queue.append(temp.right)

      if not current_queue:
        level_number += 1
        current_queue = queues[level_number % 2]
        next_queue = queues[(level_number + 1) % 2]
      return result
```

