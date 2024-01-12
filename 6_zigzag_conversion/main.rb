# The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)
# 
# P   A   H   N
# A P L S I I G
# Y   I   R
# 
# And then read line by line: "PAHNAPLSIIGYIR"
# 
# Write the code that will take a string and make this conversion given a number of rows:
# 
# string convert(string s, int numRows);
# 
#  
# 
# Example 1:
# 
# Input: s = "PAYPALISHIRING", numRows = 3
# Output: "PAHNAPLSIIGYIR"
# 
# Example 2:
# 
# Input: s = "PAYPALISHIRING", numRows = 4
# Output: "PINALSIGYAHRPI"
# Explanation:
# P     I    N
# A   L S  I G
# Y A   H R
# P     I
# 
# Example 3:
# 
# Input: s = "A", numRows = 1
# Output: "A"
# 
#  
# 
# Constraints:
# 
#     1 <= s.length <= 1000
#     s consists of English letters (lower-case and upper-case), ',' and '.'.
#     1 <= numRows <= 1000
# 

def convert(s, num_rows)
  return s if num_rows == 1
  rows = []
  num_rows.times do
    rows << []
  end

  direction = 1
  zigger = 0
  s.split("").each_with_index do |char, i|
    rows[zigger] << char
    zigger += 1 * direction
    direction = direction * -1 if zigger == (num_rows - 1) || zigger == 0
  end

  output = ""
  rows.each do |list|
    output += list.join("")
  end

  return output
end

tests = [
  [["PAYPALISHIRING", 3], "PAHNAPLSIIGYIR"],
  [["PAYPALISHIRING", 4], "PINALSIGYAHRPI"],
  [["A", 1], "A"],
  [["AB", 1], "AB"]
]

tests.each do |test|
  inputs, expected = test
  result = convert(inputs[0], inputs[1])
  puts("String: #{inputs[0]}, rows: #{inputs[1]}, expected: #{expected} result: #{result} pass?: #{expected == result}")
end
