# An array is a type of data structure that stores elements of the same type in a contiguous block of memory. In an array, 'A', of size 'N', 
# each memory location has some unique index, 'i' (where 0 ≤ i < N), that can be referenced as A[i] or A_i. 

# Reverse an array of integers. 

# Example: 
# A = [1, 2, 3]. Return [3, 2, 1]. 

# Function Description:
# Complete the function reverseArray in the editor below. reverseArray has the following parameter(s):

def reverseArray(a):
  reversed_array = a[::-1]

  return reversed_array

if __name__ = '__main__':
