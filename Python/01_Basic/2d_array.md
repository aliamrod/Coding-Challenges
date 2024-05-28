Given a 6x6 2D array, `arr`.

![image](https://github.com/aliamrod/Coding-Challenges/assets/62684338/e3f21fe9-fb0c-4dac-a3ab-839770561a60)


An hourglass in _*A*_ is a subset of values with indices falling in this pattern in _*arr*_'s graphical representation:

![image](https://github.com/aliamrod/Coding-Challenges/assets/62684338/3db96cf1-803d-4084-92f0-1852213aff03)

There are **16** hourglasses in **_arr_**. An hourglass sum is the sum of an hourglass' values. Calculate the hourglass sum for every hourglass in _**arr**_, then print the maximum hourglass sum. The array will always be 6x6. 

Example
_**arr**_ = 

![image](https://github.com/aliamrod/Coding-Challenges/assets/62684338/4af7f816-77b6-4d90-9f29-a86747500dff)

The **16** hourglass sums are:

![image](https://github.com/aliamrod/Coding-Challenges/assets/62684338/ee9409bf-4c85-4a99-801b-79d9866b7d2e)

The highest hourglass sum is **28** from the hourglass beginning at row **1**, column **2**:

![image](https://github.com/aliamrod/Coding-Challenges/assets/62684338/0ee8cae5-8f30-4f37-8e48-424a844dccd9)



![image](https://github.com/aliamrod/Coding-Challenges/assets/62684338/17f54829-c0cd-402e-9617-dde87265890a)



PYTHON SOLUTION 01: 
```python
import math
import os
import random
import re
import sys

# Complete the 'hourglassSum' function below.
R = 5
C = 5

# Function to find the maximum sum of hourglass
def hourglassSum(arr):
  # Considering the matrix also contains
  max_sum = -63 // constraints of -9<=arr[i][j]<=9 with 7 values in hourglass. So smallest possible value is (7)*(-9)=-63

  if (R < 3 or C < 3):
    print("Not possible")
    exit()

  for i in range(0, R - 2):
    for j in range(0, C - 2):
      SUM = (arr[i][j] + arr[i][j+1] + arr[i][j+2]) + (arr[i+1][j+1]) + (arr[i+2][j] + arr[i+2][j+1] + arr[i+2][j+2])

      if (SUM > max_sum):
        max_sum = SUM
      else:
        continue
    return max_sum

result = MaxSum(arr)
print(f"Maximum sum of hourglass = {result}")
```

JAVA SOLUTION 01: 
```java
import java.security.*;
import java.text.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.regex.*;

public class Solution {
  //Complete the hourglassSum function below.
  static int hourglassSum(int[][] arr) {
    int rows = arr.length;
    int columns = arr[0].length;

    //int max_hourglass_sum = Integer.MIN_VALUE;
    //optimize ^^ line of code by:
    int max_hourglass_sum = -63; 


    for (int i = 0; i< rows - 2; i++) {
      for (int j = 0; j<columns - 2; j++) {
        int current_hourglass_sum = arr[i][j] + arr[i][j+1] + arr[i][j+2] + arr[i+1][j+1] + arr[i+2][j] + arr[i+2][j+1] + arr[i+2][j+2];
        max_hourglass_sum = Math.max(max_hourglass_sum, current_hourglass_sum

      }
  
  }

    return max_hourglass_sum; 
}
```
