# Amazon Transaction Logs
Your Amazonian team is responsible for maintaining a monetary transaction service. The transactions are tracked in a log file.

A log file is provided as a string array where each entry represents a transaction to service. Each transaction consists of:

++ sender_user_id: Unique identifier for the user that initiated the transaction. It consists of only digits at most 9 digits. 

++ recipient_user_id: Unique identifier for the user that is receiving the transaction. It consists of only digits with at most 9 digits. 

++ amount_of_transaction: The amount of the transaction. It consists of only digits with at most 9 digits. 

The values are separated by a space. For example, "_sender_user_id_ _recipient_user_id_ _amount_of_transaction_".

Users that perform an excessive amount of transactions might be abusing the service so you have been tasked to identify the users that have a number of transacations over a threshold. The list of user ids should be ordered in ascending numeric value. 

**Example**
_logs_ = _["88 99 200", "88 99 300", "99 32 100", "12 12 15"]_
_threshold_ = _2_


The transactions count for each user, regardless of role are: 
| ID | Transactions |
| :---:   | :---: | 
| 99 | 3   |
| 88 | 2   |
| 12 | 1   |
| 32 | 1   |



There are two users with at least _threshold = 2 transaction: 99 and 88_. In ascending order, the return array is ['88', '99']. 

**Note**: In the last log entry, user _12_ was on both sides of the transaction. This counts as only _1_ transaction for user _12_. 

**Function Description**

Complete the function _processLogs_ in the editor below. 

The function has the following parameter(s): 

    string _logs[n]_: Each _logs[i]_ denotes the i-th entry in the logs. 
    int _threshold_: the minimum number of transactions that a user must have to be included in the result. 


Returns:
  _string[]_: An array of user id's as strings, sorted ascending by numeric value


Constraints

++ 1 ≤  _n_ ≤ 10^5

++ 1 ≤ _threshold_ ≤ n

++ The _sender_user_id_, _recipient_user_id_ and _amount_of_transaction_ contain only characters in the range ascii['0'-'9']. 

++ The _sender_user_ud_, _recipient_user_id_ and _amount_of_transaction_ start with a non-zero digit. 

++ 0 < length of _sender_user_id_, _recipient_user_id_, _amount_of_transaction_ ≤ 9. 

++ The result will contain at least one element. 
