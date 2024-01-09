# Given a string s, return the longest 
# palindromic
#  
# substring
#  in s.
# 
#  
# 
# Example 1:
# 
# Input: s = "babad"
# Output: "bab"
# Explanation: "aba" is also a valid answer.
# Example 2:
# 
# Input: s = "cbbd"
# Output: "bb"
#  
# 
# Constraints:
# 
# 1 <= s.length <= 1000
# s consist of only digits and English letters.

def longest_palindrome(s)
  return s if palindrome?(s)
  string_length = s.length
  longest_palindrome_so_far = ""

  string_length.times do |i|
    (string_length - 1).times do |j|
      end_index = j + 1
      next if end_index - i < longest_palindrome_so_far.length
      potential = s[i..end_index]
      longest_palindrome_so_far = potential if palindrome?(potential)
    end
  end

  longest_palindrome_so_far
end

def palindrome?(s)
  length = s.length
  midpoint = length / 2
  midpoint.times do |i|
    first = s[i]
    second = s[length - i - 1]
    return false unless first == second
  end
  true
end

tests = [
  ["babad", "bab"],
  ["cbbd", "bb"],
  ["aracecar", "racecar"],
  ["klsdfdeified", "deified"],
  ["gphyvqruxjmwhonjjrgumxjhfyupajxbjgthzdvrdqmdouuukeaxhjumkmmhdglqrrohydrmbvtuwstgkobyzjjtdtjroqpyusfsbjlusekghtfbdctvgmqzeybnwzlhdnhwzptgkzmujfldoiejmvxnorvbiubfflygrkedyirienybosqzrkbpcfidvkkafftgzwrcitqizelhfsruwmtrgaocjcyxdkovtdennrkmxwpdsxpxuarhgusizmwakrmhdwcgvfljhzcskclgrvvbrkesojyhofwqiwhiupujmkcvlywjtmbncurxxmpdskupyvvweuhbsnanzfioirecfxvmgcpwrpmbhmkdtckhvbxnsbcifhqwjjczfokovpqyjmbywtpaqcfjowxnmtirdsfeujyogbzjnjcmqyzciwjqxxgrxblvqbutqittroqadqlsdzihngpfpjovbkpeveidjpfjktavvwurqrgqdomiibfgqxwybcyovysydxyyymmiuwovnevzsjisdwgkcbsookbarezbhnwyqthcvzyodbcwjptvigcphawzxouixhbpezzirbhvomqhxkfdbokblqmrhhioyqubpyqhjrnwhjxsrodtblqxkhezubprqftrqcyrzwywqrgockioqdmzuqjkpmsyohtlcnesbgzqhkalwixfcgyeqdzhnnlzawrdgskurcxfbekbspupbduxqxjeczpmdvssikbivjhinaopbabrmvscthvoqqbkgekcgyrelxkwoawpbrcbszelnxlyikbulgmlwyffurimlfxurjsbzgddxbgqpcdsuutfiivjbyqzhprdqhahpgenjkbiukurvdwapuewrbehczrtswubthodv", ""]
]

tests.each do |test|
  input, expected = test
  actual = longest_palindrome(input)
  puts("Input: #{input}, Expected: #{expected}, Actual: #{actual}, Pass? #{actual == expected}")
end
