# start() & end()
# These expressions return the indices of the start and end of the substring matched by the group.
import re
me = re.search(r'\d+','1234')
m.end() # >>4
m.start() # >>0

# Task
# You are given a string 'S'. Your task is to find the indices of the start and end of string 'k' in 'S'.

# Input Format
# The first line contains the string 'S'. The second line contains the string 'k'/ 
# Constraints
# 0 < len(S) <100
# 0 < len(k) < len(S)

# Output format
# Print the tuple in this format: (start_index, end_index). If no match is found, print (-1,-1). 

# Solution
import re
def find_substring_indices(string, substring):
   pattern=re.compile('(?={})'.format(re.escape(substring))) # Lookahead regex pattern
   # **'(?={})' is the regular expression pattern string. It uses lookahead syntax, denoted by '(?=...)'. Lookahead is a zero-width assertion that matches a specific 
  # pattern but does not consume any characters in the string.
   matches=pattern.finditer(string)
   indices=[(match.start(), match.start() + len(substring) - 1) for match in matches]
   return indices if indices else [(-1,-1)]
  
# Main Code
string = input().strip()
substring = input().strip()
indices = find_substring_indices(string, substring)
for start, end in indices:
  print('({}, {})'.format(start, end))
  
    
