# Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
# 
#   An input string is valid if:
# 
#       Open brackets must be closed by the same type of brackets.
#           Open brackets must be closed in the correct order.
#               Every close bracket has a corresponding open bracket of the same type.
# 
#                
# 
# Example 1:
# 
#   Input: s = "()"
# Output: true
# 
# Example 2:
# 
#   Input: s = "()[]{}"
# Output: true
# 
# Example 3:
# 
#   Input: s = "(]"
# Output: false
# 
#  
# 
# Constraints:
# 
#       1 <= s.length <= 104
#     s consists of parentheses only '()[]{}'.

LEFTS = ["(", "[", "{"]
RIGHTS = [")", "]", "}"]
MATCH = {
  :")" => "(",
  :"]" => "[",
  :"}" => "{"
}

def is_valid(s)
  stack = []
  s.split("").each do |char|
    if LEFTS.include?(char)
      stack.append(char)
      # puts("Appending #{char}. Stack: #{stack}")
    end
    if RIGHTS.include?(char)
      # puts("Checking #{char}. Stack: #{stack}. Last item #{stack.last}. It matches? #{MATCH[char.to_sym] == stack.last}")
      return false unless MATCH[char.to_sym] == stack.last
      stack.pop
    end
  end

  stack.empty?
end

tests = [
  ["()", true],
  ["()[]{}", true],
  ["(]", false],
  ["[({})]", true],
  ["[(])", false]
]

tests.each do |test|
  result = is_valid(test.first)
  puts("Testing #{test.first}. Should be #{test[1]}, is #{result}")
end
