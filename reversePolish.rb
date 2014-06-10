=begin

  Source:  Something I came up with for practice, based on the math_eval challenge.

  Description:
    First:
      Using arrays as stacks, write a function called 'to_postfix' that will parse
      an input string in infix notation and convert it to postfix (reverse polish) notation.

      Example:  to_postfix('1 + 2 - 3 / 4 * 5')  =>  '1 2 + 3 4 / 5 * -'

    Second:
      Using arrays as stacks, write a function called 'postfix_eval'
      that will parse and evaluate a math operation in postfix notation.

      Example:  postfix_eval('1 2 + 3 4 / 5 * -')  =>  '-0.75'

    Bonus:
      Using arrays as stacks, use what you learned from the first two challenges to write a
      function called 'infix_eval' that will parse and evaluate a math operation in infix notation.

      Example:  infix_eval('1 + 2 - 3 / 4 * 5')  =>  '-0.75'

=end



# first: parses an infix string ('1 + 2 - 3 / 4 * 5') and converts it to a postfix string ('1 2 + 3 4 / 5 * -') 
VALUE = {'-' => 0, '+' => 0, '*' => 1, '/' => 2, nil => -1}

def to_postfix(string)
  stack = []
  ops = []
  string.split(" ").each do |e|
    if e.match(/\d+/) then stack << e
    else
      priority(ops, e).each { |op| stack << op }
      ops << e
    end
  end
  stack << ops.pop while !ops.empty?
  stack.join(' ')
end

def priority(ops, op2)  # helper function for 'to_postfix'
  push_ops = []
  push_ops << ops.pop while VALUE[ops.last] >= VALUE[op2]
  push_ops
end



# second: parses a postfix string ('1 2 + 3 4 / 5 * -') and evaluates it ('-0.75')
def postfix_eval(string)
  x, y = nil
  stack = []
  string.split(' ').each do |e|
    if e.match(/\d+/)
      stack << e
    else
      y = stack.pop.to_f
      x = stack.pop.to_f
      stack << x.send(e, y).to_s
    end
  end
  stack.join
end



# bonus: parses and infix string ('1 + 2 - 3 / 4 * 5') and evaluates it ('-0.75')
VAL = {'-' => 0, '+' => 0, '*' => 1, '/' => 2, nil => -1}

def infix_eval( string )
  nums = []
  ops = []
  string.split(" ").each do |e| 
    if e.match(/\d+/) then nums << e
    else
      eval_triplet( ops.pop, nums ) while VAL[ops.last] >= VAL[e]
      ops << e
    end
  end
  eval_triplet( ops.pop, nums ) while !ops.empty?
  nums.join
end

def eval_triplet(operation, nums)  # helper function for 'infix_eval'
  y = nums.pop.to_f
  x = nums.pop.to_f
  nums << x.send(operation, y)
end