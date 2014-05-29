=begin

  Source:  Codewars
  Difficulty:  4 kyu
  Title:  Sort binary tree by levels

  Description:
    You are given a binary tree (not sorted, it doesn't matter in this kata)
    represented by TreeNode class, which is defined like this:

      class TreeNode
        attr_accessor :left
        attr_accessor :right
        attr_reader :value
      end

    Your task is to return the array with elements from tree sorted by levels,
    which means the root element goes first, then root children (from left to right)
    are second and third, and so on. The leaf terminator is nil.
    Return empty array for empty tree (nil argument).

  Examples:
    The following tree:
            2
        8       9
      1   3   4   5

    Should return following array:
      [2,8,9,1,3,4,5]

    The following tree:
          1
      8       4
        3       5
                  7

    Should return following array:
      [1,8,4,3,5,7]

=end



def tree_by_levels(node)
  stack = []
  i = 0
  return stack if node.nil?

  stack.push(node)
  
  while (i < stack.length)
    stack.push(stack[i].left) unless stack[i].left.nil?
    stack.push(stack[i].right) unless stack[i].right.nil?
    stack[i] = stack[i].value
    stack.flatten.compact
    i += 1
  end
  
  stack
end