# Amazon parses logs of user transactions/activity to flag fraudulent activity. The log file is represented as an Array of arrays. The array consists of the following data:
# [<userid1> <userid2> <# of transactions>]


# Dictionary in Python is an unordered colleciton of data values that are used to store data values like a map. Unlike other Data Types that hold only single value 
# as an element, the Dictionary holds key-value pair. In Dictionary, the key must be unique and immutable. This means that a Python Tuple can be a key whereas a Python List cannot. 
# A Dictionary can be created by placing a sequence of elements within curly '{}' braces, separated by 'comma'. 

# Defaultdict is a container like dictionaries present in the module collections. Defaultdict is a sub-class of the dictionary class that returns a dictionary-like object. The functionality 
# of both dictionaries and defaultdict never raises a KeyError. It provides a default value for the key that does not exists. 

def processLogs(logs, threshold):
  from collections import defaultdict 

  transaction_count = defaultdict(int)

  # Process each log entry
  for log in logs:
    sender, recipient, amount = log.split()
    transaction_count[sender] += 1
    if sender != recipient:
      transaction_count[recipient] += 1

  # Find all users with transactions over the threshold
  result = [user_id for user_id, count in transaction_count.items() if count >= threshold]

  # Sort the result numerically
  result.sort(key = int)

  return result
    
# Example Usage:
logs = ["88 99 200", "88 99 300", "99 32 100", "12 12 15"]
threshold = 2
print(processLogs(logs, threshold)) # Output: ['88', '99']; ascending order

