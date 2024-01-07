# You are given the heads of two sorted linked lists list1 and list2.
# 
# Merge the two lists into one sorted list. The list should be made by splicing together the nodes of the first two lists.
# 
# Return the head of the merged linked list.
# 
#  
# 
# Example 1:
# 
# Input: list1 = [1,2,4], list2 = [1,3,4]
# Output: [1,1,2,3,4,4]
# 
# Example 2:
# 
# Input: list1 = [], list2 = []
# Output: []
# 
# Example 3:
# 
# Input: list1 = [], list2 = [0]
# Output: [0]
# 
#  
# 
# Constraints:
# 
#     The number of nodes in both lists is in the range [0, 50].
#     -100 <= Node.val <= 100
#     Both list1 and list2 are sorted in non-decreasing order.
# 
# 


# def merge_two_lists(list1, list2)
#   list1_len = list1.length
#   list2_len = list2.length
#   i1 = 0
#   i2 = 0
# 
#   merged = []
#   while i1 < list1_len || i2 < list2_len
#     list1_val = list1[i1] unless i1 > list1_len
#     list2_val = list2[i2] unless i2 > list2_len
# 
#     if list1_val != nil && (list1_val <= list2_val || list2_val == nil)
#       merged << list1_val
#       i1 += 1
#     elsif list2_val != nil
#       merged << list2_val
#       i2 += 1
#     end
#   end
# 
#   merged
# end

def merge_two_lists(list1, list2)
  if list1.val <= list2.val
    head = list1
    list1 = list1.next
  else
    head = list2
    list2 = list2.next
  end
  head.next = nil
  current_node = head

  while current_node != nil
    if list1 != nil && list1.val <= list2.val
      current_node.next = list1
      current_node = current_node.next
      list1 = list1.next
      current_node.next = nil
    else
      current_node.next = list2
      current_node = current_node.next
      list2 = list2.next
      current_node.next = nil
    end
  end

  head
end

class ListNode
    attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end
end

x = ListNode.new(1, ListNode.new(2, ListNode.new(4)))

tests = [
  [[[1,2,4], [1,3,4]], [1,1,2,3,4,4]],
  [[[], []], []],
  [[[], [0]], [0]],
]

tests.each do |test|
  list1, list2 = test[0]
  expected = test[1]
  result = merge_two_lists(list1, list2)
  puts("Testing #{list1} and #{list2}. Should be #{expected}, is #{result}")
end
