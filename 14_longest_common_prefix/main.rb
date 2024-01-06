# Write a function to find the longest common prefix string amongst an array of strings.
# 
#   If there is no common prefix, return an empty string "".
# 
#    
# 
# Example 1:
# 
#   Input: strs = ["flower","flow","flight"]
# Output: "fl"
# 
# Example 2:
# 
#   Input: strs = ["dog","racecar","car"]
# Output: ""
# Explanation: There is no common prefix among the input strings.
# 
#    
# 
# Constraints:
# 
#       1 <= strs.length <= 200
#     0 <= strs[i].length <= 200
#         strs[i] consists of only lowercase English letters.
# 


def longest_common_prefix(strings)
  if strings.length == 1
    return strings.first
  end
  first_string = strings.first
  common_prefix = ""

  first_string.split("").each_with_index do |char, i|
    if strings.all? { |word| word[i] == char }
      common_prefix += char
    else
      return common_prefix
    end
  end
  return common_prefix
end

tests = [
  [["flower", "flow", "flight"], "fl"],
  [["dog", "racecar", "car"], ""],
  [["flower", "flower", "flower"], "flower"],
  [[""], ""],
]

tests.each do |test|
  answer = longest_common_prefix(test.first)
  puts("testing #{test.first}. Should be #{test[1]}, got #{answer}")
end
