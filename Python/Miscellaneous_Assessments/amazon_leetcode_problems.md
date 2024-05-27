# Amazon Online Assessment Questions

1. [Find the missing number in the array](#find-the-missing-number-in-the-array)
2. [Determine if the sum of two integers is equal to the given value](#Determine-if-the-sum-of-two-integers-is-equal-to-the-given-value)
3. [Merge two sorted linked lists](#Merge-two-sorted-linked-lists)
4. [Level Order Traversal of Binary Tree](#Level-order-traversal-of-binary-tree)
5. [String segmentation](#String-segmentation)
6. [Search rotated array](#Search-rotated-array)
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

## Level order traversal of binary tree
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

```python
class Solution:
  def level_order_traversal(self, root):
    # Create list to store elements
    traversal = []
    queue = dequeue()
    # Initialize queue with the root node of the tree
    queue.append(root)

    # Iterating over the tree levels until finishes
    while queue:
      size = len(queue)
      while size:
        node = queue.popleft()

        traversal.append(node.data)
        # Adding left and right child nodes to the queue if it is there for next level traversal
        if node.left:
          queue.append(node.left)
        if node.right:
          queue.append(node.right)
        size -= 1
    return traversal
```
## String segmentation
You are given a dictionary of words and a large input string. You have to find out whether the input string can be completely semgneted into the words of a given dictionary. The following two examples elaborate on the problem further. 

![Screenshot 2024-05-26 at 8 35 35 PM](https://github.com/aliamrod/Coding-Challenges/assets/62684338/5f2f2e66-bba1-4d11-b86a-c569436e8af4)

```python
class Solution:
  def can_segment_string(self, s, dictionary):
    for i in range(len(s) + 1):
      first = s[0:i]
      if first in dictionary:
        second = s[i:]
        if not second or second in dictionary or can_segment_string(second, dictionary):
          return True
    return False
```
`not second` checks if `second` is an empty string. In the context of string segmentation, if `segment` is empty, it means there are no remaining characters to check, which implies that the initial segment (`first`) successfully splits the string into valid dictionary words. 

An empty `second` would occur if `first` exactly matches the entire remaining part of `s`, meaning the split was successful. 


## Search rotated array
Search for a given number in a sorted array, with unique elements, that has been rotated by some arbitrary number. Return `-1` if the number does not exist. Assume that the array does not contain duplicated. 



![image](https://github.com/aliamrod/Coding-Challenges/assets/62684338/66c3a2eb-a4a6-4d1e-b1b9-5e90eca6bee8)







///


def binary_search_rotated(arr, key):
  start = 0
  end = len(arr) - 1

  if start > end:
    return -1
    
  while start <= end:
    mid = start + (end - start) // 2

    if arr[mid] == key:
      return mid

    if arr[start] <= arr[mid] and key <= arr[mid] and key >= arr[start]:
      end = mid - 1
    
    elif (arr[mid] <= arr[end] and key >= arr[mid] and key <= arr[end]):
      start = mid + 1

    elif arr[start] <= arr[mid] and arr[mid] <= arr[end] and key > arr[end]:
      start = mid + 1 

    elif arr[end] <= arr[mid]:
      start = mid + 1  

    elif arr[start] >= arr[mid]:
      end = mid - 1
    
    else:
      return -1
    
  return -1
