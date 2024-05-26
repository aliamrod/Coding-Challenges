# Amazon parses logs of user transactions/activity to flag fraudulent activity. The log file is represented as an Array of arrays. The arrays consist of the following data:

# [<userid1> <userid2> <# of transactions>]
# For example:

[345366 89921 45]

# Note the data is space delimited. So, the log data would look like: [ [345366 89921 45], [029323 38239 23] ... ]

# Write a function to parse the log data to find distinct users that meet or cross a certain threshold. The function will take in 2 inputs:

# Input 1: Log data in form an array of arrays Input 2: threshold as an integer

# Output should be an array of user ids that are sorted. If same userid appears in the transaction as userid1 and userid2, it should count as one occurence, not two.



class Solution:
  def transaction_logs(self, logs, threshold):
    user_map = {}

    for log in logs:
      log_arr = logs[0].split(" ")
      user_map[log_arr[0] = user_map.get(log_arr[0], 0) + 1
      if (log_arr[0] != log_arr[1]:
        user_map[log_arr[1]] = user_map.get(log_arr[1], 0) + 1
      target_users = []
      for key, val in user_map.items():
        if (val >= threshold):
          target_users.append(int(key))
        return sorted(target_users, reverse = True)
